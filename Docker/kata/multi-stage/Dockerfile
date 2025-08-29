FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY go.mod ./
RUN go mod download
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /hello main.go

FROM scratch
COPY --from=build /hello /hello
ENTRYPOINT ["/hello"]

