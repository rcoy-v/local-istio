# local-istio

Ready-to-go local K8s cluster with [Istio](https://istio.io/) installed.
Meant to be used as a quick-start for other projects.

## Dependencies

The following tools are used locally:

- [Docker](https://docs.docker.com/install/), *required*
- [Kind](https://kind.sigs.k8s.io/), *required*
- Make, *optional*.
If unavailable, commands can be taken from the [makefile](./makefile) and run directly.

## Running Locally

- `make`: Creates local K8s cluster, and deploys Istio.
- `make destroy`: Deletes K8s cluster.
