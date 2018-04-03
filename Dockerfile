FROM golang:1.10.1 as gobuild
RUN mkdir -p /go/src
WORKDIR /go/src/go-k8s-demo
COPY main.go .
RUN go get -u github.com/labstack/echo/...
RUN go build -o app main.go
ENTRYPOINT ["./app"]
EXPOSE 1337
