FROM golang:1.23-alpine AS builder

# Install git for go mod download
RUN apk add --no-cache git

WORKDIR /app

# Copy go mod files
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY cmd/ ./cmd/

# Copy internal packages
COPY internal/ ./internal/

# Build
# Note: booker-contracts-go is imported as a dependency, no proto generation needed
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/bin/venue-svc ./cmd/venue-svc

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/bin/venue-svc .

EXPOSE 50051

CMD ["./venue-svc"]
