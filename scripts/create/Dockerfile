FROM alpine:3.11
ARG KUBECTL_VERSION=1.18.5
ARG ISTIO_VERSION=1.6.4
ENV PATH=/opt/istio-$ISTIO_VERSION/bin:$PATH
RUN apk add --no-cache --no-progress bash jq
RUN wget -qO /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl &&\
 chmod +x /usr/local/bin/kubectl
RUN wget -qO /opt/istio.tar.gz https://github.com/istio/istio/releases/download/$ISTIO_VERSION/istio-$ISTIO_VERSION-linux-amd64.tar.gz &&\
 tar -zxf /opt/istio.tar.gz -C /opt &&\
 rm /opt/istio.tar.gz
WORKDIR /root
COPY . .
ENTRYPOINT ["./run.sh"]
