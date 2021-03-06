# Jenkins master ready to run Docker image (Jenkins Swarm Plugin)

Docker images for master based on Jenkins Swarm Plugin.

This images is generic, thus you can obviously re-use it within
your non-related EEA projects.


## Supported tags and respective Dockerfile links

- [`:latest` (*Dockerfile*)](https://github.com/eea/eea.docker.jenkins.master/blob/master/Dockerfile) (default)
- [`:2.0` (*Dockerfile*)](https://github.com/eea/eea.docker.jenkins.master/blob/2.0/Dockerfile)


## Changes

 - [CHANGELOG.md](https://github.com/eea/eea.docker.jenkins.master/blob/master/CHANGELOG.md)


## Base docker image

 - [hub.docker.com](https://registry.hub.docker.com/u/eeacms/jenkins-master)


## Source code

  - [github.com](http://github.com/eea/eea.docker.jenkins.master)


## Installation

1. Install [Docker](https://www.docker.com/).

2. Install [Docker Compose](https://docs.docker.com/compose/).


## Usage

    $ docker run -p 8080:8080 eeacms/jenkins-master

And now you have a running Jenkins at http://localhost:8080

## Advanced usage

Start Jenkins with SSL support:

Create a self-signed test SSL certificate.

    $ keytool -genkey -keyalg RSA -alias selfsigned -keystore /etc/keystore.jks -storepass ToPSecRet321 -dname "cn=localhost"

Launch Jenkins

    $ docker run -p 8080:8080 \
                 -v /etc/keystore.jks:/etc/keystore.jks \
             eeacms/jenkins-master \
                 --httpPort=-1 \
                 --httpsPort=8080 \
                 --httpsKeyStore=/etc/keystore.jks \
                 --httpsKeyStorePassword=ToPSecRet321

or via environment variables:

    $ docker run -p 8080:8080 \
                 -v /etc/keystore.jks:/etc/keystore.jks \
                 -e JENKINS_OPTS="--httpPort=-1 --httpsPort=8080 --httpsKeyStore=/etc/keystore.jks --httpsKeyStorePassword=ToPSecRet321" \
             eeacms/jenkins-master

See `--help` for more options:

    $ docker run --rm eeacms/jenkins-master --help

See also [EEA Jenkins master-slave orchestration](https://github.com/eea/eea.docker.jenkins) for a complete guide on running a Jenkins master-slave stack.


## Supported environment variables

* `JAVA_OPTS` You might need to customize the JVM running Jenkins master, typically to pass system properties or tweak heap memory settings. Use JAVA_OPTS environment variable for this purpose.
* `JENKINS_OPTS` Start Jenkins with custom options. Useful if you want to start Jenkins on `https` for example.

## Copyright and license

The Initial Owner of the Original Code is European Environment Agency (EEA).
All Rights Reserved.

The Original Code is free software;
you can redistribute it and/or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation;
either version 2 of the License, or (at your option) any later
version.


## Funding

[European Environment Agency (EU)](http://eea.europa.eu)
