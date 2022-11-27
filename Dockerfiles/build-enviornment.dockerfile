FROM ubuntu:latest

RUN apt-get update &&  \
    apt-get install -y  \
    build-essential  \
    clang \
    clang-format \
    clang-tidy \
    cmake \
    gdb \
    git \
    ninja-build  \
    python3-pip \
    wget \
    && \
    apt-get clean && \
    pip install --no-cache cmake-format