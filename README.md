# Kingston ABM

Models the Kingston, Ontario region in Covisim.

See kingston-param for help interpreting the regional configuration.

## Usage
```
docker build --tag sim .
docker run -it -v /path/to/local/folder:/src -p 8888:8888 sim
```

From within the docker machine:
```
conda init bash
bash
conda activate covisim
conda install -c anaconda jupyter
jupyter notebook --allow-root --ip=0.0.0.0 --port=8888
```
## Requirements

Docker

## Citing This Work
