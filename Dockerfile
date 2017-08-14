FROM debian:stretch-slim

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

ADD rustup-init.sh .

RUN set -eux; \
        apt-get update -qqy \
        && apt-get install -qqy \
            curl \
            file \
            git \
        && sh rustup-init.sh -y --default-toolchain 1.19.0 \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf rustup-init.sh
