FROM ubuntu:latest

RUN apt-get update &&  \
    apt-get install -y  \
    build-essential  \
    clang  \
    cmake \
    ninja-build  \
    && \
    apt-get clean