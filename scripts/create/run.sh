#!/usr/bin/env bash
set -euo pipefail

export KUBECONFIG=/root/app/kubeconfig.yaml

cd app

istioctl manifest apply -f istio.yaml
istioDeployments="$(kubectl -n istio-system get deploy -o json | jq -r '.items[].metadata.name')"

for deploy in $istioDeployments; do
    kubectl -n istio-system rollout status -w deploy $deploy
done

kubectl apply -k k8s/base
