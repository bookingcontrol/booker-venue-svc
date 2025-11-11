# Makefile для локальной разработки venue-svc
# Используется для разработки одного сервиса

.PHONY: build test run tidy migrate

# Update dependencies
tidy:
	@echo "📦 Updating dependencies..."
	@go mod tidy

# Build service
build:
	@echo "🔨 Building venue-svc..."
	@go build -o bin/venue-svc ./cmd/venue-svc

# Run tests
test:
	@echo "🧪 Running tests..."
	@go test ./...

# Run tests with coverage
test-coverage:
	@echo "🧪 Running tests with coverage..."
	@go test -cover ./...

# Run service locally (requires infrastructure to be running)
run:
	@echo "🚀 Running venue-svc locally..."
	@go run ./cmd/venue-svc

# Run migrations for this service
migrate:
	@echo "📦 Running migrations..."
	@if [ -f migrations/*.sql ]; then \
		echo "⚠️  Migrations should be run via booker-infra"; \
	fi

