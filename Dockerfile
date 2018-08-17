# Dockerfile

FROM python:slim

RUN apt-get update && \
    apt-get install -y git curl zip jq

RUN ISTIOCTL=$(curl -s https://api.github.com/repos/istio/istio/releases/latest | jq -r '.tag_name') && \
    curl -sL https://github.com/istio/istio/releases/download/${ISTIOCTL}/istio-${ISTIOCTL}-linux.tar.gz | tar xz && \
    mv istio-${ISTIOCTL}/bin/istioctl /usr/local/bin/istioctl

ENTRYPOINT ["bash"]
