FROM ubuntu:noble

RUN apt update &&\
    apt install -y --no-install-recommends \
    wget \
    libssl-dev \
    zlib1g-dev \
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
    gcc-14-arm-linux-gnueabihf \
    g++-14-arm-linux-gnueabihf \
    libgnutls28-dev \
    python3 python3-dev python3-setuptools python3-setuptools swig
RUN update-alternatives --install /usr/bin/arm-linux-gnueabihf-cpp arm-linux-gnueabihf-cpp /usr/bin/arm-linux-gnueabihf-cpp-14 70 &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-14 70 &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-14 70 &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc-ranlib arm-linux-gnueabihf-gcc-ranlib /usr/bin/arm-linux-gnueabihf-gcc-ranlib-14 70  &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcov arm-linux-gnueabihf-gcov /usr/bin/arm-linux-gnueabihf-gcov-14 70  &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcov-dump arm-linux-gnueabihf-gcov-dump /usr/bin/arm-linux-gnueabihf-gcov-dump-14 70  &&\
    update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcov-tool arm-linux-gnueabihf-gcov-tool /usr/bin/arm-linux-gnueabihf-gcov-tool-14 70

RUN apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

ENV ARCH=arm
ENV CROSS_COMPILE=arm-linux-gnueabihf-
ENV CXX=${CROSS_COMPILE}g++
ENV CC=${CROSS_COMPILE}gcc
