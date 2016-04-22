FROM jenkins:2.0-beta-2
MAINTAINER "Thiago Ramos" <thiagoramos.al@gmail.com>

# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
ENV HOME $JENKINS_HOME

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    graphviz \
    npm \
 && rm -rf /var/lib/apt/lists/*
USER jenkins
