.PHONY: build test run

IMAGE_NAME = 600000
CONTAINER_NAME = 600-wtf
PORT = 6006

build:
	docker build -t $(IMAGE_NAME) .

test:
	@echo "Running tests..."
	npm run test:e2e

run:
	@echo "Restarting container..."
	docker stop $(CONTAINER_NAME) 2>/dev/null || true
	docker rm $(CONTAINER_NAME) 2>/dev/null || true
	docker run -d --restart always --name $(CONTAINER_NAME) -p $(PORT):80 $(IMAGE_NAME)
	@echo "Container $(CONTAINER_NAME) is running at http://localhost:$(PORT)"
