FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    wget \
    curl \
    git \
    sudo \ 
    supervisor 

RUN \
  apt-get install -y software-properties-common python-software-properties && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  #java -version && \
  rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
CMD ["bash"]
