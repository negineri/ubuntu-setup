FROM python:3.9
LABEL maintainer="harusoin@gmail.com"

WORKDIR /root
ARG DEBIAN_FRONTEND=noninteractive
COPY * ./
RUN apt-get -q -y update \
  && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install git sshpass \
  && apt-get -q -y autoremove \
  && apt-get -q -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip install --upgrade pip \
  && pip install ansible \
  && chmod 755 ./setup.sh

ENTRYPOINT ["./setup.sh"]

