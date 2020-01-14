FROM grafana/tanka:0.6.1
ARG KUBECTL_VERSION=1.16.4
RUN wget -qO /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
