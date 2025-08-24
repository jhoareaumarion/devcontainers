FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye 
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible DevContainer"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

    # Install pipx using the Python user environment
RUN python3 -m pip install --user pipx && \
    python3 -m pipx ensurepath && \
    # Ensure pipx is in the PATH
    pipx ensurepath && \
    pipx ensurepath --global || true && \
    # Install Ansible with dependencies via pipx
    pipx install --include-deps ansible && \
    # Install ansible-lint
    pipx install ansible-lint

COPY post-create.sh /usr/local/bin/post-create.sh
RUN chmod +x /usr/local/bin/post-create.sh

CMD ["/bin/bash"]