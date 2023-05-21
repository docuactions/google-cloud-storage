FROM node:14-alpine

LABEL version="1.0.0"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git \
    openssl \
    openssh-client \
    python2 \
    py-pip \
    build-base \
    autoconf \
    automake \
    libtool \
    nasm \
    zlib-dev \
    libjpeg-turbo-dev \
    libpng-dev

RUN pip install --no-cache-dir google-cloud-sdk

RUN npm install -g yarn

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
