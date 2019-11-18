# Dockerfile

FROM alpine

RUN apk add --no-cache bash curl tar

ENV VERSION 1.4.0-beta.2

RUN curl -sL https://github.com/istio/istio/releases/download/${VERSION}/istio-${VERSION}-linux.tar.gz | tar xz && \
    mv istio-${VERSION}/bin/istioctl /usr/local/bin/istioctl

ENTRYPOINT ["bash"]
