# Dockerfile

FROM alpine

RUN apk add --no-cache bash curl

RUN ISTIOCTL=$(curl -s https://api.github.com/repos/Azure/draft/releases/latest | grep tag_name | cut -d'"' -f4) && \
    curl -sL https://github.com/istio/istio/releases/download/${ISTIOCTL}/istio-${ISTIOCTL}-linux.tar.gz | tar xz && \
    mv istio-${ISTIOCTL}/bin/istioctl /usr/local/bin/istioctl

ENTRYPOINT ["bash"]
