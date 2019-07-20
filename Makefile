.PHONY: .FORCE
GO=go

SRC_DIR = ./src

NEW_GOPATH := $(GOPATH):$(shell pwd)
export GOPATH := $(NEW_GOPATH)


all:
	@echo "GOPATH="$(GOPATH)
	$(GO) build -o bin/conn_t services/connector
	$(GO) build -o bin/game_t services/game
#	$(GO) build -o bin/api_t services/api

fmt:
	$(GO) fmt $(SRC_DIR)/...

proto:
	cd $(SRC_DIR)/core/protos/gameProto && protoc --go_out=. gameProto.proto
	cd $(SRC_DIR)/core/libs/grpc/ipc && protoc --go_out=plugins=grpc:. *.proto
