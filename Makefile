.PHONY: build run dev clean

# Binary name
BINARY_NAME=activitypub-server

# Go related variables
GOBASE=$(shell pwd)
GOBIN=$(GOBASE)/bin

# Main build target
build:
	@echo "Building..."
	@go build -o $(GOBIN)/$(BINARY_NAME) ./cmd/server

# Run the application
run: build
	@echo "Running..."
	@$(GOBIN)/$(BINARY_NAME)

# Development mode using air for hot reload
dev:
	@if ! command -v air > /dev/null && ! [ -f ~/go/bin/air ] && ! [ -f $(go env GOPATH)/bin/air ]; then \
		echo "Installing air..."; \
		go install github.com/air-verse/air@latest; \
	fi
	@echo "Starting development server..."
	@if command -v air > /dev/null; then \
		air; \
	elif [ -f ~/go/bin/air ]; then \
		~/go/bin/air; \
	else \
		$(go env GOPATH)/bin/air; \
	fi

# Clean build artifacts
clean:
	@echo "Cleaning..."
	@rm -rf $(GOBIN)
	@go clean

# Install dependencies
deps:
	@echo "Installing dependencies..."
	@go mod download

# Run tests
test:
	@echo "Running tests..."
	@go test ./... -v 