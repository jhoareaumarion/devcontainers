FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye 
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible + Kubernetes + OpenTofu for VS Code"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace


    # Update packages and install dependencies for repository management
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg wget && \
    # Create keyring directory
    install -m 0755 -d /etc/apt/keyrings && \
    # Download OpenTofu GPG keys
    wget -qO- https://get.opentofu.org/opentofu.gpg | tee /etc/apt/keyrings/opentofu.gpg >/dev/null && \
    wget -qO- https://packages.opentofu.org/opentofu/tofu/gpgkey | gpg --no-tty --batch --dearmor -o /etc/apt/keyrings/opentofu-repo.gpg && \
    # Add OpenTofu APT repository
    echo "deb [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main" | tee /etc/apt/sources.list.d/opentofu.list >/dev/null && \
    echo "deb-src [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main" | tee -a /etc/apt/sources.list.d/opentofu.list >/dev/null && \
    # Set proper permissions
    chmod a+r /etc/apt/sources.list.d/opentofu.list

    # Update package lists and install OpenTofu
RUN apt-get update && \
    apt-get install -y tofu
CMD ["/bin/bash"]