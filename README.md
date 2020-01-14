# local-istio

Ready-to-go local Kubernetes cluster with [Istio](https://istio.io/) installed.
Meant to be used as a quick-start for other projects.

## Dependencies

The following tools are used locally:

- [Docker](https://docs.docker.com/install/), *required*
- [Kind](https://kind.sigs.k8s.io/), *required*
- Make, *optional*.
If unavailable, commands can be taken from the [makefile](./makefile) and run directly.
- [Istioctl](), *optional*.
A local Docker image is used for running the necessary commands to install Istio.
- [Kubectl](), *optional*.
Not directly needed for creating the resources of this project,
but will likely be wanted for interacting with the K8s cluster after creation.

## Running Locally

- `make`: Creates local K8s cluster, and deploys Istio.
- `make clean`: Deletes K8s cluster.
- `make reset`: Shorthand for `make clean; make`.
Useful for quickly starting over.
