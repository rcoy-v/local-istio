FROM alpine
ARG ISTIO_VERSION=1.4.3
ARG KUBECTL_VERSION=1.16.4
ENV PATH=/opt/istio-$ISTIO_VERSION/bin:${PATH}
RUN wget -qO /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
RUN wget -qO /opt/istio.tar.gz https://github.com/istio/istio/releases/download/$ISTIO_VERSION/istio-$ISTIO_VERSION-linux.tar.gz
RUN tar -zxf /opt/istio.tar.gz -C /opt
ENTRYPOINT ["istioctl"]
