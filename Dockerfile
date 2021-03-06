FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Istanbul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip \
            texinfo gcc-multilib build-essential chrpath socat cpio python \
            python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping \
            python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm locales \
            vim bash-completion screen openssl curl gnutls-bin 

RUN groupadd -g 1000 dev \
            && useradd -u 1000 -g dev -d /home/dev dev \
            && mkdir /home/dev \
            && chown -R dev:dev /home/dev

RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER dev

WORKDIR /home/dev

