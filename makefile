MAKEFLAGS+=--silent
.PHONY: create clean

name=local-istio

create:
	kind create cluster --name ${name} --config kind.yaml

clean:
	kind delete cluster --name ${name}
