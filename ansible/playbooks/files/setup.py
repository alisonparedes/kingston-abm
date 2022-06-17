from setuptools import setup


with open('requirements.txt', 'r') as f:
    requirements = [line.strip() for line in f.readlines() if not line.startswith("#")]

setup(
    name='ctt',
    version='19986f7427a7a643eb05fb41e5ed4dd113362cd6',
    packages=['ctt', 'ctt.models', 'ctt.inference', 'ctt.data_loading'],
    url='https://github.com/nasimrahaman/ctt',
    license='MIT',
    author='Nasim Rahaman',
    author_email='nasim.rahaman@tuebingen.mpg.de',
    description='Contact Tracing Transformer',
    install_requires=requirements,
    extras_require={
        'tensorflow': [
            'tensorflow==2.1',
            'tensorflow-addons==0.9.1',
            'onnx==1.6',
            'onnx-tf @ git+https://github.com/onnx/onnx-tensorflow.git@c4fc047e7ec71daa6aa8f71e9cc2ee9e5a3768b6#egg=onnx-tf'
        ],
    }
)
