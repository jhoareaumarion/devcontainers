FROM mcr.microsoft.com/devcontainers/python:1-${templateOption:imageVariant}
#${templateOption:imageVariant}

LABEL org.opencontainers.image.source="https://github.com/jhoareaumarion/devcontainers"
LABEL org.opencontainers.image.description="Ansible DevContainer"
LABEL org.opencontainers.image.licenses="MPL 2.0"

WORKDIR /workspace

# Copy the installation script
COPY install_ansible.sh /tmp/install_ansible.sh

# Run the script
RUN /tmp/install_ansible.sh && \
    rm /tmp/install_ansible.sh

COPY post_create.sh /usr/local/bin/post_create.sh
RUN chmod +x /usr/local/bin/post_create.sh

CMD ["/bin/bash"]