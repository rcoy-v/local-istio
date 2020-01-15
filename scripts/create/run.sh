#!/usr/bin/env bash
set -euo pipefail

export KUBECONFIG=/root/app/kubeconfig.yaml

cd app

istioctl manifest apply -f istio.yaml
istioDeployments="$(kubectl -n istio-system get deploy -o json | jq -r '.items[].metadata.name')"

for deploy in $istioDeployments; do
    kubectl -n istio-system rollout status -w deploy $deploy
done

cp -R k8s /tmp/k8s
cd /tmp/k8s
tk env set --server "$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')" environments/default
tk apply --dangerous-auto-approve environments/default
