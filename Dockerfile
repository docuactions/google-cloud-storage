FROM node:18.16.0-alpine

ENV GCS_VERSION = "159.0.0"

RUN apk update && \
  apk upgrade && \
  apk add --no-cache \
  bash \
  git \
  python3 \
  curl

RUN curl -sSL https://sdk.cloud.google.com | bash

ENV PATH $PATH:/root/google-cloud-sdk/bin

RUN npm install -g yarn --force

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
