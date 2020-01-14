(import "kubernetes.libsonnet") +

local namespace="istio-system";

{
  kiali: {
    virtualService: $.k.virtualService.new("kiali", namespace, "/kiali", "kiali")
  }
}
