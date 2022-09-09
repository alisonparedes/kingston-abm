# Image contains all the basic tools needed to run experiments

FROM ubuntu:20.04


# Install Python 3

RUN apt update 
RUN apt install python3 python3-pip -y


# Install Miniconda

# https://conda.io/projects/conda/en/latest/user-guide/install/rpm-debian.html

RUN apt install curl -y
RUN curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
RUN install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg
RUN gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list
RUN apt update
RUN apt install conda -y
ENV PATH="/opt/conda/bin:${PATH}"
RUN /opt/conda/bin/conda init bash


# Install GNU Parallel

RUN apt install parallel -y 


# Install Git

RUN apt install git -y


RUN /opt/conda/bin/conda create -n covisim python=3.8 -y

# Install CTT
RUN git clone https://github.com/mila-iqia/COVI-ML.git && cd COVI-ML && git checkout 19986f7427a7a643eb05fb41e5ed4dd113362cd6

# patch requirements/setup
RUN git clone https://github.com/QuMuLab/kingston-abm.git && \
    cp kingston-abm/resources/requirements.txt COVI-ML/requirements.txt && \
    cp kingston-abm/resources/setup.py COVI-ML/setup.py

RUN cd COVI-ML && /opt/conda/bin/conda run -n covisim pip install -e .

# install agent based model
ADD https://api.github.com/repos/QuMuLab/COVI-AgentSim/git/refs/heads/real-map-data .covi-agentsim__ref
RUN git clone -b real-map-data https://github.com/QuMuLab/COVI-AgentSim.git && \
    cd COVI-AgentSim && /opt/conda/bin/conda run -n covisim pip install -e .

# install remaining dependencies
RUN /opt/conda/bin/conda run -n covisim conda install -c anaconda jupyter 
