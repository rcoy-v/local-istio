{
  k:: {
    virtualService: {
      new(name, namespace, path, dest): {
        apiVersion: "networking.istio.io/v1alpha3",
        kind: "VirtualService",
        metadata: {
          name: name,
          namespace: namespace
        },
        spec: {
          gateways: [
            "ingressgateway"
          ],
          hosts: [
            "*"
          ],
          http: [
            {
              match: [
                {
                  uri: {
                    prefix: path
                  },
                }
              ],
              route: [
                {
                  destination: {
                    host: dest
                  }
                }
              ]
            }
          ]
        }
      }
    }
  }
}
