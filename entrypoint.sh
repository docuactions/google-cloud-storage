#!/bin/sh


RUN apk update && \
  apk upgrade && \
  apk add --no-cache \
  bash \
  curl

RUN pip install --no-cache-dir gcloud && \
  curl -sSL https://sdk.cloud.google.com | bash

ENV PATH $PATH:/root/google-cloud-sdk/bin

set -e

if [ -z "$GCS_BUCKET" ]; then
  echo "GCS_BUCKET is not set. Quitting."
  exit 1
fi

if [ -z "$GCS_SERVICE_KEY" ]; then
  echo "GCS_SERVICE_KEY is not set. Quitting."
  exit 1
fi

echo "$GCS_SERVICE_KEY" > /tmp/gcs-service-key.json

echo "Install yarn"
npm install -g yarn --force

echo "Install dependencies"
yarn install

echo "Run yarn build"
yarn run build

echo "Copying to website folder"
gcloud auth activate-service-account --key-file=/tmp/gcs-service-key.json
gsutil -m rsync -r ./build gs://${GCS_BUCKET}

echo "Cleaning up things"
rm /tmp/gcs-service-key.json
