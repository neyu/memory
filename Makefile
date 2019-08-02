.PHONY: .FORCE
GO=go

SRC_DIR = ./src

NEW_GOPATH := $(GOPATH):$(shell pwd)
export GOPATH := $(NEW_GOPATH)


all:
	@echo "GOPATH="$(GOPATH)
	$(GO) build -o bin/login_t services/login
	$(GO) build -o bin/gate_t services/gate
	$(GO) build -o bin/game_t services/game
#	$(GO) build -o bin/hub_t services/hub
#	$(GO) build -o bin/web_t services/web
	$(GO) build -o bin/client services/client

fmt:
	$(GO) fmt $(SRC_DIR)/...

proto:
	cd $(SRC_DIR)/services/msg/proto && protoc --go_out=. *.proto
	cd $(SRC_DIR)/core/xnet/rpc && protoc --go_out=. rpc.proto
	cd $(SRC_DIR)/core/xnet/relay && protoc --go_out=. relay.proto
#	cd $(SRC_DIR)/core/xnet/relay && protoc --go_out=plugins=grpc:. relay.proto
