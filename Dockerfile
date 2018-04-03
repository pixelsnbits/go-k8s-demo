FROM golang:1.10.1 as gobuild
RUN mkdir -p /go/src
WORKDIR /go/src/go-k8s-demo
COPY main.go .
RUN go get -u github.com/labstack/echo/...
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
go build -o bin/app main.go

FROM alpine:3.7 as alpineimg
COPY --from=gobuild /go/src/go-k8s-demo/bin/app ./
ENTRYPOINT ["./app"]
EXPOSE 1337
