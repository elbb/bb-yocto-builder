from debian:buster-slim

RUN apt-get update \
    && apt-get install -y \
      build-essential \
      chrpath \
      cpio \
      diffstat \
      gawk \
      gcc-multilib \
      git-core \
      gosu \
      iproute2 \
      iptables \
      libsdl1.2-dev \
      locales \
      socat \
      sudo \
      texinfo \
      tmux\
      unzip \
      wget \
      xterm \
    && apt-get autoremove \
    && apt-get clean
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && /usr/sbin/locale-gen
RUN update-alternatives --set iptables /usr/sbin/iptables-legacy
RUN mkdir /yocto
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
