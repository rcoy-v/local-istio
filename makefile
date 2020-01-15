MAKEFLAGS+=--silent
.PHONY: create clean reset build-create

name=local-istio

create: build-create
	kind create cluster --name ${name} --config kind.yaml
	kind get kubeconfig --name ${name} > kubeconfig.yaml
	docker run \
		--network host \
		-v $$PWD:/root/app:ro \
		${name}/create

build-create:
	cd scripts/create && \
	docker build -t ${name}/create .

clean:
	kind delete cluster --name ${name}

reset: clean create
