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
conda init bash
bash
conda activate covisim
jupyter notebook --allow-root --ip=0.0.0.0 --port=8888
```
then go to http://localhost:8888

Once you are in jupyter notebook, navigate to `src/experiments/notebooks/Interactive_Simulation.ipynb`.

There you can tweek the parameters, then start the streamlit server.

Due to incompatabilities between streamlit and jupyter notebook, the output of the server is not shown.

I would suggest giving the server a couple seconds to start up and then following the localhost list at the bottom of the notebook.
## Requirements

Docker

## Citing This Work
