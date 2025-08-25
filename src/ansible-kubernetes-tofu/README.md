
# Ansible + Kubernetes + OpenTofu (ansible-kubernetes-tofu)

Develop applications using Ansible, Kubernetes and OpenTofu

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Python version (use -bookworm, or -bullseye variants on local arm64/Apple Silicon): | string | 3.12-bullseye |
| additionalPythonPackages | A comma-separated list of python packages you want to include in the devcontainer. Example: `request,pytest,flask` | string | - |
| additionnalAnsibleCollections | A comma-separated list of ansible collections you want to include in the devcontainer. Example: `community.docker,ansible.posix,kubernetes.core | string | - |



---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/jhoareaumarion/devcontainers/blob/main/src/ansible-kubernetes-tofu/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
