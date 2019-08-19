.PHONY: .FORCE
GO=go

SRC_DIR = ./src

NEW_GOPATH := $(GOPATH):$(shell pwd)
export GOPATH := $(NEW_GOPATH)


all:
	@echo "GOPATH="$(GOPATH)
	$(GO) build -o bin/xlogin services/login
	$(GO) build -o bin/xgate services/gate
	$(GO) build -o bin/xgame services/game
#	$(GO) build -o bin/xhub services/hub
#	$(GO) build -o bin/xweb services/web
	$(GO) build -o bin/xclient services/client

fmt:
	$(GO) fmt $(SRC_DIR)/...

proto:
	cd $(SRC_DIR)/services/msg/proto && protoc --go_out=. *.proto
	cd $(SRC_DIR)/core/xnet/rpc && protoc --go_out=. rpc.proto
	cd $(SRC_DIR)/core/xnet/relay && protoc --go_out=. relay.proto
#	cd $(SRC_DIR)/core/xnet/relay && protoc --go_out=plugins=grpc:. relay.proto
