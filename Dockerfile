FROM jenkins:2.0-beta-2
MAINTAINER "Thiago Ramos" <thiagoramos.al@gmail.com>

# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
ENV HOME $JENKINS_HOME
ENV DOCKER_VERSION=1.11.0 \
    DOCKER_COMPOSE_VERSION=1.6.2 \
    DOCKER_COMPOSE_MD5=9f56f13032b04645009aa2b3fcd889bd

USER root
RUN apt-get update \
 && apt-get install -y sudo \
 && apt-get install -y vim \
 && apt-get install -y --no-install-recommends \
   graphviz \
   npm \
   apparmor \
   libsystemd-journal0 \
   libapparmor-dev \
   apt-transport-https \
   ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update \
 && apt-get purge lxc-docker \
 && apt-cache policy docker-engine
RUN apt-get install -y --no-install-recommends docker-engine=$DOCKER_VERSION* \
 && rm -rf /var/lib/apt/lists/* \
 && curl -o /bin/docker-compose -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-Linux-x86_64 \
 && echo "$DOCKER_COMPOSE_MD5  /bin/docker-compose" | md5sum -c - \
 && chmod +x /bin/docker-compose

RUN usermod -a -G docker jenkins
USER jenkins
