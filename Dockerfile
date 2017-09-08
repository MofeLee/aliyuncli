FROM alpine

ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

# install envsubst
RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    jq \
    ca-certificates \
  && pip install \
    aliyuncli \
    aliyun-python-sdk-ecs \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /root/.aliyuncli

COPY ./aliyunconfig/* /root/.aliyuncli/
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
