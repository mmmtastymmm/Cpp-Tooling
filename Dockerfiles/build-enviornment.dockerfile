FROM ubuntu:latest

RUN apt-get update &&  \
    apt-get install -y  \
    build-essential  \
    clang  \
    ninja-build  \
    && \
    apt-get clean