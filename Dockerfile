FROM ubuntu:14.04
RUN apt-get update && apt-get install -y \
    python \
    python-dev \
    python-numpy \
    python-setuptools \
    vim \
    build-essential \
    mysql-client \
    wget \
    zip
RUN wget https://github.com/CloudScale-Project/Deployment-Scripts/archive/master.zip
RUN unzip master.zip
WORKDIR Deployment-Scripts-master
RUN python setup.py install