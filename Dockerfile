# Base image
FROM golang:1.21 AS builder

# Set working directory
WORKDIR /app

# Copy files
COPY go.mod go.sum ./
RUN go mod download
COPY . .

# Build binary
RUN go build -o main .

# Create a minimal image for running
FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/main .

# Expose port and run the application
EXPOSE 8080
CMD ["./main"]
