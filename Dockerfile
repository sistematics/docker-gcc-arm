FROM ubuntu:bionic

RUN apt update &&\
    apt install -y --no-install-recommends \
    wget \
    libssl-dev \
    bc \
    kmod \
    u-boot-tools \
    texinfo \
    flex \
    bison \
    unzip \
    libtool-bin \
    xz-utils \
    file \
    help2man \
    libncurses-dev \
    gawk \
    gcc \
    g++ \
    make \
    patch \
    git \
    gcc-7-arm-linux-gnueabihf \
    g++-7-arm-linux-gnueabihf \
    python3 python3-dev python3-distutils python3-setuptools swig
RUN update-alternatives --install /usr/bin/arm-linux-gnueabihf-cpp arm-linux-gnueabihf-cpp /usr/bin/arm-linux-gnueabihf-cpp-7 70 &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-7 70 &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-7 70 &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc-ranlib arm-linux-gnueabihf-gcc-ranlib /usr/bin/arm-linux-gnueabihf-gcc-ranlib-7 70  &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcov arm-linux-gnueabihf-gcov /usr/bin/arm-linux-gnueabihf-gcov-7 70  &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcov-dump arm-linux-gnueabihf-gcov-dump /usr/bin/arm-linux-gnueabihf-gcov-dump-7 70  &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcov-tool arm-linux-gnueabihf-gcov-tool /usr/bin/arm-linux-gnueabihf-gcov-tool-7 70

RUN apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

ENV CROSS_COMPILE=arm-linux-gnueabihf-
ENV CXX=${CROSS_COMPILE}g++
ENV CC=${CROSS_COMPILE}gcc