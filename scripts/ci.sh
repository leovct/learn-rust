#!/bin/bash
# This script allows to build all the Rust projects contained in this monorepo
# Usage: ./scripts/ci.sh [-v|--verbose]

# Run cargo build command for every path in a list
build() {
  while read path; do
    echo "Project: $path"
		arg="${args[0]}"
		if [[ "$arg" == "--verbose" || "$arg" == "-v" ]]; then
			cargo build --verbose --manifest-path "$path"
		else
			cargo build --manifest-path "$path"
		fi
  done
}

args="$@"

# Find all the directories containing a Cargo.toml file
find . -name 'Cargo.toml' | sort | build
