FROM ubuntu:latest

RUN apt-get update &&  \
    apt-get install -y  \
    build-essential  \
    clang \
    clang-format \
    clang-tidy \
    cmake \
    ninja-build  \
    && \
    apt-get clean