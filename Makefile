BUILD_DIR := build
TOOL_SOURCES := tool/pubspec.lock $(shell find tool -name '*.dart')
BUILD_SNAPSHOT := $(BUILD_DIR)/build.dart.snapshot

default: book

# Run pub get on tool directory.
get:
	@ cd ./tool; pub get

# Remove all build outputs and intermediate files.
clean:
	@ rm -rf $(BUILD_DIR)
	@ rm -rf gen

# Build the site.
book: $(BUILD_SNAPSHOT)
	@ dart $(BUILD_SNAPSHOT)

# Run a local development server for the site that rebuilds automatically.
serve: $(BUILD_SNAPSHOT)
	@ dart $(BUILD_SNAPSHOT) --serve

$(BUILD_SNAPSHOT): $(TOOL_SOURCES)
	@ mkdir -p build
	@ echo "Compiling Dart snapshot..."
	@ dart --snapshot=$@ --snapshot-kind=app-jit tool/bin/build.dart >/dev/null

deploy: book
	@ firebase deploy --only hosting

.PHONY: book clean default get serve deploy
