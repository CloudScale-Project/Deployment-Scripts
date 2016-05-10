## CloudScale deployment scripts
CloudScale deployment scripts are Python scripts for deploying showcase for CloudScale project on Amazon Web Services
and Openstack. The showcase is a book store written in Java Spring Framework according to TPC-W standard. We call it [CloudStore](https://github.com/CloudScale-Project/CloudStore). Scripts are configurable so you can also use them for deploying your application to Amazon Web Services or Openstack.

We also provide the [distributed JMeter scripts](https://github.com/CloudScale-Project/Distributed-Jmeter) for load testing the [CloudStore](https://github.com/CloudScale-Project/CloudStore) application or your own application.

## Prerequisites
Using deployment scripts requires that you have already installed the following software:
- Python 2.7
- pip
- virtualenv
- MySQL database 

## Installation

1. Create new virtual environment using Python package ```virtualenv```

2. In newly created environment execute the following command:

  ```
  $ pip install -e https://github.com/CloudScale-project/Showcase/deployment-scripts/zipball/deployment-scripts
  ```

  You can also install it manually by downloading ZIP archive and execute:

  ```
  $ python setup.py install
  ```

  from extracted ZIP archive.

3. 
This will install CloudScale deployment scripts to your ```site-packages``` folder of your Python distribution.

## Configuration
Deployment scripts enables user to deploy [CloudStore](https://github.com/CloudScale-Project/CloudStore) on Amazon Web Services or OpenStack.

We already provide example config files for both clouds and you can find them in ```bin/``` directory.
On OpenStack you can also deploy CloudStore using MongoDB (**alpha**).

### Amazon Web Services configuration file
For deploying CloudStore on Amazon Web Services use ```bin/config.aws.example.ini``` config file which is structured like:

##### [DATABASE]

```name``` - Database name

```user``` - Username used to authenticate to database 

```password``` - Password used to authenticate to database

```dump_url``` - URL to the database dump. See also 

##### [APPLICATION]

```distribution_url``` - URL to compiled and packaged version of CloudStore.

```connection_pool_size``` - Connection pool size to database. If using multiple databases, value should tell maximum number of connection to **one** database.

```num_instances``` - Number of database instances

##### [AUTO_SCALABILITY]

```enabled``` - Possible values: 'yes' or 'no'. Enables or disable autoscalability

```cooldown``` - How many seconds does autoscaling waits before executing new autoscaling operation. See [AWS documentation](http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html)

##### [AWS]

```aws_access_key_id``` - AWS access key

```aws_secret_access_key``` - AWS secret key

```region``` - Codename of the region where all instances should be deployed

```availability_zone``` - Default availability zone of region where instances should be deployed

##### [RDS]

```instance_type``` - RDS instance type

```num_replicas``` - Number of RDS replicas

```master_identifier``` - Identifier for master RDS instance

```replica_identifier``` - Identifier for replica RDS instance

##### [EC2]

```instance_type``` - EC2 instance type

```ami_id``` - Amazon Machine Image from which all EC2 instances will be provisioned

```key_name``` - Name of the key pair on the AWS

```key_pair``` - Path to key pair. It's auto generated

```remote_user``` - Default username to SSH to EC2 instances

```instance_identifier``` - Instance identifier

### OpenStack configuration file

For OpenStack we have included support for MySQL database and MongoDB database (**alpha**).

#### OpenStack MySQL configuration file structure

##### [OPENSTACK]

```username``` - Provide username to authenticate to OpenStack 

```password``` - Provide password to authenticate to OpenStack

```tenant_name``` - Tenant VMs will launch in

```auth_url``` - Keystone authentication URL

```key_name``` - Name of key pair used to authenticate to VM

```key_pair``` - Path to key pair used to authenticate to VM

##### [APPLICATION]

```num_instances``` - Number of instances to provision

```image_name``` - Name of the VM image to provision new VMs from

```image_username``` - Name of the user for SSH authentication

```instance_type``` - Flavor used for new instances

##### [DATABASE]

```database_type``` - Database type (```mysql``` for MySQL and ```mongo``` for MongoDB)

```database_name``` - Database name

```database_host``` - Database host

```database_user``` - Database user

```database_pass``` - Database password

```instance_type``` - Flavor used for database instances

```num_replicas``` - Number of replicas without master instance (if replication is used)

```connection_pool_size``` - Connection pool size

##### [MYSQL]

```setup_type``` - Type of setup (```master-slave``` or ```master-master```)

```dump_url``` - URL to SQL dump 

```image_name``` - Name of image used to provision new instances from

```showcase_url``` - URL to the WAR where CloudStore is hosted

#### OpenStack MongoDB configuration file structure

##### [OPENSTACK]

Please see description for *OpenStack MySQL configuration file structure*

##### [APPLICATION]

Please see description for *OpenStack MySQL configuration file structure*

##### [DATABASE]

Please see description for *OpenStack MySQL configuration file structure*

##### [MONGODB]
```dump_url``` - URL to MongoDB archive containing exported database
```image_name``` - Name of the image on OpenStack to provision MongoDB instance from
```showcase_url``` - URL to the WAR where CloudStore is hosted

## Usage
You can run each script in ```cloudscale/deployment_scripts/scripts``` as standalone or use the wrapper around them in ```bin/run.py```.
Since these are Python scripts you can run it with ```python``` interpreter.

Example for deploying CloudStore on OpenStack:

```
$ python bin/run.py openstack bin/config.openstack.mysql.example.ini
```

The general usage for ```run.py``` is:

```
$ python bin/run.py <aws|openstack> <path to config>
```

### Amazon Web Services
## Setup RDS service
Before you can run deployment scripts you must setup RDS service. On RDS service create new Parameter Group with name 'mygroup' for **MySQL version 5.1** and set the parameter ```query_cache_size`` to value 0.

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
