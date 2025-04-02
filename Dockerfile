# *** Build
FROM alpine:3.21.3 as build
ENV MIMALLOC_VERSION=v3.0.3

RUN set -ex; \
  apk add --no-cache \
    curl \
    wget \
    unzip \
    build-base \
    linux-headers \
    make \
    cmake \
    g++ \
    git; \
  git clone https://github.com/microsoft/mimalloc.git; \
  cd /mimalloc; \
  git checkout ${MIMALLOC_VERSION}; \
  mkdir build; \
  cd build; \
  cmake ..; \
  make -j$(nproc); \
  make install

# *** Header
FROM alpine:3.21.3
COPY --from=build /mimalloc/build/*.so.* /lib/
ENV LD_PRELOAD=/lib/libmimalloc.so
ENV MIMALLOC_LARGE_OS_PAGES=1

# *** Run
USER root

# *** update image
RUN set -ex \
  && apk --no-cache --update add \
    curl \
    tzdata \
    shadow \
  && apk --no-cache --update upgrade

RUN set -ex; \
  ln -s /lib/libmimalloc.so.* /lib/libmimalloc.so || echo "libmimalloc.so linked"

# *** create user
RUN set -ex \
  && groupmod -g 1000 users \
  && useradd -u 1000 -U -d /home/user -s /bin/false abc \
  && usermod -G users abc \
  && mkdir -p /home/user

USER abc
