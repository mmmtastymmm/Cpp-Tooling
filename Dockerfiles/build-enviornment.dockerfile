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
    libunwind8 \
    ninja-build  \
    python3-pip \
    wget \
    && \
    apt-get clean && \
    pip install --no-cache cmake-format

RUN wget https://github.com/DynamoRIO/drmemory/releases/download/release_2.5.0/DrMemory-Linux-2.5.0.tar.gz && \
    tar xzf DrMemory-Linux-2.5.0.tar.gz && \
    rm DrMemory-Linux-2.5.0.tar.gz

ENV PATH=$PATH:/DrMemory-Linux-2.5.0/bin
