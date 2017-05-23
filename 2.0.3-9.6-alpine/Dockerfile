FROM postgres:9.6-alpine

MAINTAINER Linhe Huo <linhe.huo@gmail.com>

ENV PLV8_VERSION v2.0.3

RUN apk --update add  git curl make gcc g++ perl python tar \
    && mkdir -p /tmp/build \
    && curl -o /tmp/build/${PLV8_VERSION}.tar.gz -SL "https://github.com/plv8/plv8/archive/$PLV8_VERSION.tar.gz" \
    && cd /tmp/build \
    && tar -xzf /tmp/build/${PLV8_VERSION}.tar.gz -C /tmp/build/ \
    && cd /tmp/build/plv8-${PLV8_VERSION#?} \
    && make static \
    && make install \
    && strip /usr/lib/postgresql/${PG_MAJOR}/lib/plv8.so \
    && cd / \
    && rm -rf /tmp/build
