MAKEFLAGS+=--silent
.PHONY: create clean reset build-istioctl istioctl build-tanka

name=local-istio

create: build-istioctl build-tanka
	kind create cluster --name ${name} --config kind.yaml
	kind get kubeconfig --name ${name} > kubeconfig.yaml
	docker run \
		--network host \
		-v $$PWD/istio.yaml:/tmp/istio.yaml \
		-v $$PWD/kubeconfig.yaml:/root/.kube/config \
		local-istio/istioctl \
		manifest apply -f /tmp/istio.yaml
	docker run -it \
		--network host \
		-v $$PWD/k8s:/usr/src/app \
		-v $$PWD/kubeconfig.yaml:/root/.kube/config \
		-w /usr/src/app \
		local-istio/tanka \
		env set --server $$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}') environments/default
	docker run -it \
		--network host \
		-v $$PWD/k8s:/usr/src/app \
		-v $$PWD/kubeconfig.yaml:/root/.kube/config \
		-w /usr/src/app \
		local-istio/tanka \
		apply --dangerous-auto-approve environments/default

build-istioctl:
	docker build -t local-istio/istioctl -f istioctl/Dockerfile .

build-tanka:
	docker build -t local-istio/tanka -f tanka/Dockerfile .

clean:
	kind delete cluster --name ${name}

reset: clean create
