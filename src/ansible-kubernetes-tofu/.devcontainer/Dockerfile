FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye 
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible + Kubernetes + OpenTofu for VS Code"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

COPY opentofu/install_tofu.sh install_tofu.sh
RUN bash ./install_tofu.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

COPY kubectl/install_kubectl.sh install_kubectl.sh
RUN bash ./install_kubectl.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

COPY ansible/install_ansible.sh install_ansible.sh
RUN bash ./install_ansible.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

CMD ["/bin/bash"]