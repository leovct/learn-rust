# Helper for Rust development.
# - rustup: managed rust version
# - rustc: rust compiler

##@ Help

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Rust

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
