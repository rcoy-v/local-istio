# local-istio

Ready-to-go local Kubernetes cluster with [Istio](https://istio.io/) installed.
Meant to be used as a quick-start for other projects.

## Dependencies

The following tools are used locally:

- [Docker](https://docs.docker.com/install/), *required*
- [Kind](https://kind.sigs.k8s.io/), *required*
- Make, *optional*.
If unavailable, commands can be taken from the [makefile](./makefile) and run directly.
- [Istioctl](https://istio.io/docs/setup/install/istioctl/), *optional*.
A local Docker image is used for running the necessary commands to install Istio.
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/), *optional*.
Not directly needed for creating the resources of this project,
but will likely be wanted for interacting with the K8s cluster after creation.
- [Tanka](https://tanka.dev/), *optional*.
Used to generate and apply additional K8s manifests.
A local Docker image is used for running the necessary commands.

## Running Locally

- `make`: Creates local K8s cluster, and deploys Istio.
- `make clean`: Deletes K8s cluster.
- `make reset`: Shorthand for `make clean; make`.
Useful for quickly starting over.

After standing everything up with `make`, it may take a few minutes for all Istio components to become ready.
The `make` script will wait until all pods are ready.

Once `make` is finished, the Istio ingress-gateway can be reached at `http://localhost:8080`.

### Services Exposed

Some of the demo profile services that are deployed are exposed through the gateway as well.

- [Kiali](http://localhost:8080/kiali)
    - Login credentials are `admin:admin`.
