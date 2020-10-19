# 
# Makefile for validating and building Golang code
# based on OpenAPI 3.0 specs
#
# (c) 2017-2020 Roozbeh Farahbod
# 

include ../MANIFEST

DATE := $(shell date | sed 's/\ /_/g')

GOOS ?= darwin

# --- Common Go

go-fmt:
	@go fmt .

go-validate:
	@echo go vet
	@go vet .
	@echo golint
	@golint -set_exit_status .

# --- Server

go-build-linux:
	@echo "build linux binary"
	$(MAKE) go-build GOOS=linux GOARCH=amd64 TARGET=$(PROJECT)-linux-amd64

go-build-pi:
	@echo "build linux binary for raspberry pi"
	$(MAKE) go-build GOOS=linux GOARCH=arm GOARM=7 TARGET=$(PROJECT)-linux-arm7

go-build-windows:
	@echo "build windows binary"
	$(MAKE) go-build GOOS=windows GOARCH=386 TARGET=$(PROJECT)-windows-386.exe

go-build-mac:
	@echo "build Mac binary"
	$(MAKE) go-build GOOS=darwin GOARCH=amd64 TARGET=$(PROJECT)-darwin-amd64

TARGET ?= $(PROJECT)

go-build: 
	go build -o ./bin/$(TARGET)

go-build-all: go-build-pi go-build-linux go-build-windows go-build-mac

run: go-build
	./bin/$(TARGET)


