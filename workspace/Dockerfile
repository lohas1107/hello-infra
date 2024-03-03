FROM ubuntu:22.04 AS base
RUN apt update
RUN apt install -y make
RUN apt install -y curl

FROM base AS node
WORKDIR /opt
RUN curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh
RUN chmod 500 nsolid_setup_deb.sh
RUN ./nsolid_setup_deb.sh 18
RUN apt install -y nodejs

FROM node AS workspace
WORKDIR /workspace