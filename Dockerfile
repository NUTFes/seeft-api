FROM golang:1.16.3

ENV GO111MODULE=on
ENV GOPATH=/go

WORKDIR /go/src/github.com/mashita1023/test-api

RUN go get github.com/cosmtrek/air

CMD air
