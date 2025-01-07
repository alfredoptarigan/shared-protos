.PHONY: proto clean run build

PROTO_DIR = .
OUT_DIR = .

# Compile Proto
proto:
	find . -name "*.proto" | while read -r proto_file; do \
  		echo "Compiling $$proto_file..."; \
		protoc --proto_path=. --go_out=. --go-grpc_out=. "$$proto_file"; \
	done

# Clean the compiled files
clean:
	find $(OUT_DIR) -name "*.pb.go" -type f -delete

# Compile proto and run the server
run: proto
	go run main.go

# Build binary
build: proto
	go build -o bin/server main.go
