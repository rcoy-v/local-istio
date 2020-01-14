MAKEFLAGS+=--silent
.PHONY: create clean reset build-istioctl istioctl

name=local-istio

create: build-istioctl
	kind create cluster --name ${name} --config kind.yaml
	kind get kubeconfig --name ${name} > kubeconfig.yaml
	docker run \
		--network host \
		-v $$PWD/istio.yaml:/tmp/istio.yaml \
		-v $$PWD/kubeconfig.yaml:/root/.kube/config \
		local-istio/istioctl \
		manifest apply -f /tmp/istio.yaml

build-istioctl:
	docker build -t local-istio/istioctl -f istioctl.Dockerfile .

clean:
	kind delete cluster --name ${name}

reset: clean create
