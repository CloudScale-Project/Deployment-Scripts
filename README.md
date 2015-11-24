## CloudScale deployment scripts
CloudScale deployment scripts are Python scripts for deploying showcase for CloudScale project on Amazon Web Services
and Openstack. The showcase is a book store written in Java Spring Framework according to TPC-W standard. Scripts are
configurable so you ca also use them for deploying your application to Amazon Web Services or Openstack.

## About CloudScale project
The goal of CloudScale is to aid service providers in analysing, predicting and resolving scalability issues,
i.e., support scalable service engineering. The project extends existing and develops new solutions that support
the handling of scalability problems of software-based services.

You can read more about CloudScale project on: http://www.cloudscale-project.eu

## Prerequisites
Before you can use deployment scripts you need to install MySQL on your system. You can do that by executing command:

```
$ brew install mysql
```

You should also check the path to the ```mysql``` command in ```scripts/platform/aws/dump.sh``` file. This path can be different, depends on OS on which you are running deployment scripts. On Linux it is in ```/usr/bin/mysql``` or ```/bin/mysql```.

## Installation
To install scripts download zip or checkout repository and then run:

```
$ python setup.py install
```

This will install CloudScale deployment scripts to your ```site-packages``` folder of your Python distribution.

If you want to install it with ```pip``` you can do this by running the following command:

```
$ pip install -e https://github.com/CloudScale-project/Showcase/deployment-scripts/zipball/deployment-scripts
```

## Usage
You can run scripts in ```cloudscale/deployment_scripts/scripts/``` as standalone or use them as part of your application. The example of using scripts as part of your
application is in ```bin/run.py``` file.

### Amazon Web Services
## Setup RDS service
Before you can run deployment scripts you must setup RDS service. On RDS service create new Parameter Group with name 'mygroup' for MySQL version 5.1 and set the parameter ```query_cache_size`` to value 0.

## Run deployment scripts
To deploy showcase on Amazon Web Services edit ```bin/config.aws.ini``` file and run:

```
$ python run.py aws config.aws.ini
```

### Openstack
To deploy MySQL version of showcase on OpenStack edit ```bin/config.openstack.mysql.ini``` and run:

```
$ python run.py openstack config.openstack.mysql.ini
```

To deploy MongoDB version of showcase on OpenStack edit ```bin/config.openstack.mongo.ini``` and run:

```
$ python run.py openstack config.openstack.mongo.ini
```
