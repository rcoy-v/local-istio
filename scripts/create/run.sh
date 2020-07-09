#!/usr/bin/env bash
set -euo pipefail

export KUBECONFIG=/root/app/kubeconfig.yaml

cd app

istioctl operator init
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/istio.yaml

until [ "$(kubectl -n istio-system get deploy | tail -n +2 | wc -l)" == "7" ]; do
    echo "Waiting for Istio control plane install"
    sleep 3
done

istioDeployments="$(kubectl -n istio-system get deploy -o json | jq -r '.items[].metadata.name')"
for deploy in $istioDeployments; do
    kubectl -n istio-system rollout status -w deploy $deploy
done

kubectl apply -f k8s/ingressgateway.yaml
kubectl apply -f k8s/kiali-virtualservice.yaml
