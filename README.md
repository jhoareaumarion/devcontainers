# Dev Container Templates

A collection of my pre-configured **Dev Container** templates for mostly Homelab or semi-professional environments. These templates help you quickly set up a consistent and reproducible development environment using the `devcontainer` CLI to create devcontainers according to [Development Containers](https://containers.dev/) standard.

The following documentation will also show how to use the `devcontainer` CLI to fetch a template and add it to a project.

## 🚀 Getting Started

### Prerequisites
- **Docker**: Ensure Docker is installed and running on your machine.
- **Dev Container CLI**: Install the [Dev Container CLI](https://github.com/devcontainers/cli). *(I developed and tested this in a **WSL** environment.)*
- **VS Code**: Install [Visual Studio Code](https://code.visualstudio.com/) and the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension. *(While [other supporting tools](https://containers.dev/supporting) may work, I’ve only tested this setup with VS Code.)*


### Understanding the Templates 

| Template Name               | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| `ansible`                   | Pre-configured with Ansible and its dependencies.                         |
| `kubectl`                   | Pre-configured with `kubectl` for Kubernetes development.                 |
| `tofu`                      | Pre-configured with OpenTofu (Terraform) for infrastructure as code.       |
| `ansible-bitwarden-kubernetes-tofu`  | Combines Ansible, Bitwarden CLI, Kubernetes tools (`kubectl`), and OpenTofu (Terraform). |

## 🛠 Using a Template

Each template is stored in its dedicated directory, under `src/`.
Please read the `README.md` located in the template directory to better understands the options available for each template. 

As per the [Development Containers](https://containers.dev/) standard, use the below command to render one of the templates from the repository
``` bash
devcontainer templates apply \
--workspace-folder {{ YOUR_PROJECT }} \
--template-id ghcr.io/jhoareaumarion/devcontainers/{{TEMPLATE_ID}}:latest \
--template-args {{ TEMPLATE_OPTIONS }}
```
| Template Name               | TEMPLATE_ID               | TEMPLATE_OPTIONS             |
|-----------------------------|---------------------------|---------------------------|
| `ansible`                   | ansible                   | See [README.md](src/ansible/README.md)
| `kubectl`                   | kubectl                   | N/A
| `tofu`                      | tofu                      | N/A
| `ansible-bitwarden-kubernetes-tofu`   | ansible-bitwarden-kubernetes-tofu   | See [README.md](src/ansible-bitwarden-kubernetes-tofu/README.md)

### Examples of devcontainer commands

#### Using the `tofu devcontainer template` in the project at ~/Project
``` bash
devcontainer templates apply \
--workspace-folder ~/Project \
--template-id ghcr.io/jhoareaumarion/devcontainers/tofu:latest
```
#### Using the `ansible devcontainer template` in the project at ~/Project without any additional Python packages nor Ansible Collections
``` bash
devcontainer templates apply \
--workspace-folder ~/Project \
--template-id ghcr.io/jhoareaumarion/devcontainers/ansible:latest
```
#### Using the `ansible-bitwarden-kubernetes-tofu devcontainer template` in the project at ~/Project with the Python packages `requests`, `pytest`
``` bash
devcontainer templates apply \
--workspace-folder ~/Project \
--template-id ghcr.io/jhoareaumarion/devcontainers/ansible-bitwarden-kubernetes-tofu:latest
--template-args '{ "additionalPythonPackages":"requests,pytest" }'
```
#### Using the `ansible devcontainer template` in the project at ~/Project with the Python packages `requests`, `pytest` and the Ansible Collection `community.docker`
``` bash
devcontainer templates apply \
--workspace-folder ~/Project \
--template-id ghcr.io/jhoareaumarion/devcontainers/ansible:latest
--template-args '{ "additionalAnsibleCollections":"community.docker", "additionalPythonPackages":"requests,pytest" }'
```