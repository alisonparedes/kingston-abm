# Kingston ABM

Models the Kingston, Ontario region in Covisim.

See kingston-param for help interpreting the regional configuration.

## Usage

```
docker build --tag sim .
docker run -it -v /path/to/local/folder:/src -p 8888:8888 -p 8501:8501 sim
```

From within the docker machine:

```
conda activate covisim
cd kingston-abm/experiments/notebooks
jupyter notebook --allow-root --ip=0.0.0.0 --port=8888
```

Access the notebook from the link output in the console

Open `Interactive_Simulation.ipynb`

There you can tweak the parameters and start the streamlit server.

Follow the link at the bottom of the notebook to access the streamlit server.

> Due to incompatibilities between streamlit and jupyter notebook, the output of the server is not shown.

## Requirements

Docker

## Citing This Work
