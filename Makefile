# Helper for Rust development.
# - rustup: managed rust version
# - rustc: rust compiler
# - rust crate registry: https://crates.io/
# - rust book: https://rust-book.cs.brown.edu/ch00-00-introduction.html

##@ Help

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Project
PROJECT=guessing_game

.PHONY: new
new: ## Create a new Rust project with Cargo (specify the name using PROJECT=...).
	cargo new $(PROJECT)

# It's also possible to use 'rustc ./PROJECT/src/main.rs' to build a project using rustc
.PHONY: build
build: ## Build a Rust program.
	cd $(PROJECT) && cargo build

.PHONY: run
run: ## Build and run a Rust program.
	cd $(PROJECT) && cargo run

.PHONY: update
update: ## Update crates.
	cd $(PROJECT) && cargo update

.PHONY: doc
doc: ## Build and display documentation.
	cd $(PROJECT) && cargo doc --open

.PHONY: project
project: ## Display PROJECT value.
	@echo default project is set to: $(PROJECT)

##@ Tools (Rust & Cargo)

.PHONY: rust-install
rust-install: ## Install Rust.
	curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

.PHONY: rust-update
rust-update: ## Update Rust.
	rustup update

.PHONY: rust-uninstall
rust-uninstall: ## Uninstall Rust.
	rustup self uninstall

.PHONY: rust-version
rust-version: ## Display Rust version.
	rustc --version

.PHONY: cargo-version
cargo-version: ## Display Cargo version.
	cargo --version
