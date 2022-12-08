#!/bin/bash
# This script allows to build all the Rust projects contained in this monorepo

# Run cargo build command for every path in a list
build() {
  while read path; do
    echo "Project: $path"
		cargo build --verbose --manifest-path "$path"
  done
}

# Find all the directories containing a Cargo.toml file
find . -name 'Cargo.toml' | sort | build
