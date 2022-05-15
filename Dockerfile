FROM alpine:3.12

ARG GAD_VERSION=1.4.2

RUN apk add --update --no-cache bind-tools openssl

RUN wget -qO- https://github.com/brianpcurran/gandi-automatic-dns/archive/v${GAD_VERSION}.tar.gz | tar xvz && \
    mv gandi-automatic-dns-${GAD_VERSION}/gad /gad && \
    rm -rf gandi-automatic-dns-${GAD_VERSION}/ && \
    chmod +x /gad

ENTRYPOINT ["/gad"]
