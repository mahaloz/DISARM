FROM ubuntu:16.04
MAINTAINER zbasque@asu.edu
# ----- INSTALL DEV TOOLS ----- #
USER root
run useradd -s /bin/bash -m disarm 
RUN apt-get update && apt-get install -y sudo 
RUN echo "ml-docker ALL=NOPASSWD: ALL" > /etc/sudoers.d/ml-docker
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils git curl vim unzip openssh-client wget \
    build-essential cmake \
    libopenblas-dev \
    libpq-dev pkg-config zlib1g-dev libtool libtool-bin wget \
    automake autoconf coreutils bison libacl1-dev \
    qemu-user qemu-kvm socat postgresql-client nasm binutils-multiarch llvm clang \
    libpq-dev parallel libgraphviz-dev \
    build-essential libssl-dev libffi-dev \
    libxml2-dev libxslt1-dev zlib1g-dev 

# ----- INSTALL MAVPROXY ----- 
RUN apt-get update && apt-get install -y python3 python3-dev python3-pip
RUN pip3 install ipython MAVProxy

# ----- SETUP DISARM ----- #
RUN git clone https://github.com/mahaloz/DISARM.git 
RUN pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git

