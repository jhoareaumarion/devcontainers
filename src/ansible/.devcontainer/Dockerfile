FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye 
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible DevContainer"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

ARG PYTHON_PACKAGES
ARG ANSIBLE_COLLECTIONS

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

RUN if [ ! -z "$PYTHON_PACKAGES" ]; then \
    pipx inject ansible $(echo $PYTHON_PACKAGES | tr ',' ' '); \
fi && \
    if [ ! -z "$ANSIBLE_COLLECTIONS" ]; then \
        echo "Installing Ansible collections..."; \
        echo "Collections: $ANSIBLE_COLLECTIONS"; \
        echo "collections:" > /tmp/requirements.yml; \
        for c in $(echo $ANSIBLE_COLLECTIONS | tr ',' ' '); do \
            echo "  - name: $c" >> /tmp/requirements.yml; \
        done; \
        ansible-galaxy collection install -r /tmp/requirements.yml; \
    fi

CMD ["/bin/bash"]