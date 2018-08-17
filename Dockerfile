# Dockerfile

FROM python:slim

RUN apt-get update && \
    apt-get install -y curl

RUN ISTIOCTL=$(curl -s https://api.github.com/repos/Azure/draft/releases/latest | grep tag_name | cut -d'"' -f4) && \
    curl -sL https://github.com/istio/istio/releases/download/${ISTIOCTL}/istio-${ISTIOCTL}-linux.tar.gz | tar xz && \
    mv istio-${ISTIOCTL}/bin/istioctl /usr/local/bin/istioctl

ENTRYPOINT ["bash"]
