FROM alpine

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install aliyuncli \
  && rm -rf /var/cache/apk/*
