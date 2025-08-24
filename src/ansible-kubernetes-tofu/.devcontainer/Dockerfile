FROM ghcr.io/jhoareaumarion/devcontainers/tofu:latest as tofu
FROM ghcr.io/jhoareaumarion/devcontainers/kubectl:latest as kubectl
FROM ghcr.io/jhoareaumarion/devcontainers/ansible:latest as ansible

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible + Kubernetes + OpenTofu for VS Code"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

CMD ["/bin/bash"]