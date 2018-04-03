FROM golang:1.10.1 as gobuild
ENV SRC=/go/src
RUN mkdir -p /go/src
WORKDIR /go/src/go-k8s-demo
RUN go get -u github.com/labstack/echo/...

RUN git clone https://github.com/pixelsnbits/go-k8s-demo.git /go/src/go-k8s-demo \
&& CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
go build -o bin/go-k8s-demo

FROM alpine:3.7 as alpineimg
WORKDIR /docker/bin
COPY --from=gobuild /go/src/go-k8s-demo/bin/ ./
ENTRYPOINT /docker/bin/go-k8s-demo
EXPOSE 1337
