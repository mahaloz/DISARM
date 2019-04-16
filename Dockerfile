FROM ubuntu:16.04
MAINTAINER zbasque@asu.edu
# ----- INSTALL DEV TOOLS ----- #
USER root
run useradd -s /bin/bash -m disarm 
RUN apt-get update && apt-get install -y sudo 
RUN echo "disarm ALL=NOPASSWD: ALL" > /etc/sudoers.d/disarm
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
RUN apt-get update && apt-get install -y python3 python3-dev python3-pip python python-dev python-pip 
RUN pip3 install ipython MAVProxy 

# ----- INSTALL PWNTOOLS ----- #
RUN pip install pwntools
RUN pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git 

# ----- SETUP DISARM ----- #
RUN cd /home/ && git clone https://github.com/mahaloz/DISARM.git 
WORKDIR /home/DISARM/
#RUN pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git

