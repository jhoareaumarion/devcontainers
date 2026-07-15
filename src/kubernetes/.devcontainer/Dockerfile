# Use the official Python image, not Microsoft's
FROM python:3.12-bullseye

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Kubernetes/Kubeseal/Hubble for Code Server"
LABEL org.opencontainers.image.licenses="MPL 2.0"

# Avoid interactive package installation dialogs
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

# Force bash as our builder shell so we can securely handle pipe failures
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# All setup and installations grouped into one single layer to minimize final image size
RUN \
    # 1. Create 'coder' user and set up workspace ownership
    useradd -m -s /bin/bash coder && \
    chown -R coder:coder /workspace && \
    \
    # 2. Purge problematic third-party repo lists
    rm -f /etc/apt/sources.list.d/yarn.list* 2>/dev/null || true && \
    \
    # 3. Update packages and install core tools (Using minimal recommend configurations)
    apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        jq \
        git && \
    \
    # 4. Grant passwordless sudo to coder
    usermod -aG sudo coder && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    \
    # 5. Setup Kubernetes upstream repo key/sources
    mkdir -p -m 755 /etc/apt/keyrings/ && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.35/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.35/deb/ /' > /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
    \
    # 6. Install kubectl 
    apt-get update && \
    apt-get install -y --no-install-recommends kubectl && \
    \
    # 7. Dynamically identify CPU architecture (amd64 vs arm64)
    ARCH="amd64" && if [ "$(uname -m)" = "aarch64" ]; then ARCH="arm64"; fi && \
    \
    # 8. Fetch and install Kubeseal
    RESPONSE=$(curl -L -s https://api.github.com/repos/bitnami-labs/sealed-secrets/releases/latest) && \
    KUBESEAL_VERSION=$(echo "$RESPONSE" | jq -r '.tag_name' 2>/dev/null | cut -c 2-) && \
    if [ -z "$KUBESEAL_VERSION" ] || [ "$KUBESEAL_VERSION" = "null" ]; then \
        echo "Error: Failed to extract Kubeseal version. Check API rate limits."; exit 1; \
    fi && \
    echo "Detected Kubeseal version: $KUBESEAL_VERSION" && \
    curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-${ARCH}.tar.gz" && \
    tar -xvzf "kubeseal-${KUBESEAL_VERSION}-linux-${ARCH}.tar.gz" kubeseal && \
    install -m 755 kubeseal /usr/local/bin/kubeseal && \
    rm -f "kubeseal-${KUBESEAL_VERSION}-linux-${ARCH}.tar.gz" kubeseal && \
    \
    # 9. Fetch and verify Hubble
    HUBBLE_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/hubble/master/stable.txt) && \
    curl -L --fail --remote-name-all "https://github.com/cilium/hubble/releases/download/${HUBBLE_VERSION}/hubble-linux-${ARCH}.tar.gz" && \
    curl -L --fail --remote-name-all "https://github.com/cilium/hubble/releases/download/${HUBBLE_VERSION}/hubble-linux-${ARCH}.tar.gz.sha256sum" && \
    sha256sum --check hubble-linux-${ARCH}.tar.gz.sha256sum && \
    tar xzvfC "hubble-linux-${ARCH}.tar.gz" /usr/local/bin && \
    rm -f "hubble-linux-${ARCH}.tar.gz" "hubble-linux-${ARCH}.tar.gz.sha256sum" && \
    \
    # 10. Clean up apt package index caches entirely (Reduces ~50MB+ footprint)
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER coder

CMD ["/bin/bash"]
