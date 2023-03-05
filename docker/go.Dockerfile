FROM golang:1.20.1-alpine

WORKDIR /

COPY . .

RUN go build -o app .

entrypoint ["/app"]

