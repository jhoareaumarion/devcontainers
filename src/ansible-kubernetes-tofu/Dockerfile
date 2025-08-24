FROM mcr.microsoft.com/devcontainers/python:1-${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible + Kubernetes + OpenTofu for VS Code"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

COPY ansible/installAnsible.sh installAnsible.sh
RUN bash ./installAnsible.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

COPY opentofu/installOpentofu.sh installOpentofu.sh
RUN bash ./installOpentofu.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

COPY kubernetes/installKubernetes.sh installKubernetes.sh
RUN bash ./installKubernetes.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

CMD ["/bin/bash"]