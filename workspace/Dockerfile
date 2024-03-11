FROM ubuntu:22.04 AS base
RUN apt update
RUN apt install -y make
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y zip
RUN apt install -y unzip

RUN apt install -y locales
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

FROM base AS node
WORKDIR /tmp
RUN curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh
RUN chmod 500 nsolid_setup_deb.sh
RUN ./nsolid_setup_deb.sh 18
RUN apt install -y nodejs

FROM node AS jvm
RUN apt install -y openjdk-17-jdk
RUN wget -c https://services.gradle.org/distributions/gradle-8.6-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-8.6-bin.zip
ENV GRADLE_HOME=/opt/gradle/gradle-8.6
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Gradle cache directory
VOLUME GRADLE_CACHE

FROM jvm AS rust
RUN apt install -y build-essential
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

FROM rust AS workspace
WORKDIR /workspace