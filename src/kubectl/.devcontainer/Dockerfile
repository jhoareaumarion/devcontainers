FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye 
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible + Kubernetes + OpenTofu for VS Code"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

    # Update packages and install dependencies
run apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release && \
    # Create keyring directory if it doesn't exist
    install -m 0755 -d /etc/apt/keyrings && \
    # Download Kubernetes GPG key
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    # Add Kubernetes APT repository
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list >/dev/null && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list

    # Update package lists and install kubectl
RUN apt-get update && \
    apt-get install -y kubectl && \

CMD ["/bin/bash"]