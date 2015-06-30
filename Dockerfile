FROM ubuntu:14.04
RUN echo 'deb http://cran.at.r-project.org/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes \
    python \
    python-dev \
    python-numpy \
    python-setuptools \
    vim \
    build-essential \
    mysql-client \
    wget \
    zip \
    r-base
RUN echo 'install.packages("ggplot2", repos="http://cran.rstudio.com/")' | R --vanilla
RUN wget https://github.com/CloudScale-Project/Distributed-Jmeter/archive/master.zip -O distributed_jmeter.zip
RUN unzip distributed_jmeter.zip
WORKDIR Distributed-Jmeter-master
RUN python setup.py install
WORKDIR /
RUN wget https://github.com/CloudScale-Project/Deployment-Scripts/archive/master.zip -O deployment_scripts.zip
RUN unzip deployment_scripts.zip
WORKDIR Deployment-Scripts-master
RUN python setup.py install
