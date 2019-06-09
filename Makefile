.DEFAULT_GOAL := help

name := `yq r repo.yml name`

help: # automatically documents the makefile, by outputing everything behind a ##
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Prereqs:
# 	- homebrew => https://brew.sh/
# 	- docker => `brew cask install docker`
# 	- yq => `brew install yq`

build: ## ⚙️  Build into local environment
	@./infra/startup.sh $(name)
	@docker exec $(name) infra/build.sh $(name)

test: build ## ✅ Run all checks - tests, linters, etc.
	@docker exec $(name) infra/test.sh $(name)

clean: ## 🗑️  Clear local files and assets
	@./infra/clean.sh $(name)
