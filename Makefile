BIN = node_modules/.bin

.PHONY: deploy bootstrap

node_modules: yarn.lock package.json
	@yarn
	@touch node_modules

bootstrap: node_modules
