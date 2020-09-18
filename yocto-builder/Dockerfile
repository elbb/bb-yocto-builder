from debian:buster-slim

RUN apt-get update \
    && apt-get install -y \
      gawk \
      wget \
      git-core \
      diffstat \
      unzip \
      texinfo \
      gcc-multilib \
      build-essential \
      chrpath \
      socat \
      libsdl1.2-dev \
      xterm \
      cpio \
      gosu \
      locales \
      iproute2 \
      sudo \
      iptables \
    && apt-get autoremove \
    && apt-get clean
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && /usr/sbin/locale-gen
RUN update-alternatives --set iptables /usr/sbin/iptables-legacy
RUN mkdir /yocto
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
