FROM golang:latest AS builder
ENV CGO_ENABLED=0
ADD ./cmd/server /app
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /main ./
RUN chmod +x ./main
CMD ["./main"]
EXPOSE 80