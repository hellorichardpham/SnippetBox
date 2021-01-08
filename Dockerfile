FROM golang:alpine

ENV GO11MODULE=ON \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /build

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build ./cmd/web

EXPOSE 4000

CMD ["go", "run", "./cmd/web"]