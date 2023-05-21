FROM node:18.16.0-alpine

ENV GCS_VERSION = "159.0.0"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git \
    openssl \
    openssh-client \
    python3 \
    py-pip \
    build-base \
    autoconf \
    automake \
    libtool \
    nasm \
    zlib-dev \
    libjpeg-turbo-dev \
    libpng-dev

RUN pip install --no-cache-dir gcloud

RUN npm install -g yarn --force

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
