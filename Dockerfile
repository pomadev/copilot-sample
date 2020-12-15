FROM golang:1.15 as builder

WORKDIR /go/src/app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/app

FROM scratch

COPY --from=builder /go/bin/app /go/bin/app
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/go/bin/app"]
