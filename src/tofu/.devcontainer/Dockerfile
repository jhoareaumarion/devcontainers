FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye 
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible + Kubernetes + OpenTofu for VS Code"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

# Copy the installation script
COPY install_tofu.sh /tmp/install_tofu.sh

# Run the script
RUN /tmp/install_tofu.sh && \
    rm /tmp/install_tofu.sh

CMD ["/bin/bash"]