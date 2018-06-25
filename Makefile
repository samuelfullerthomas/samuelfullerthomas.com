BIN = node_modules/.bin

.PHONY: deploy bootstrap

node_modules: yarn.lock package.json
	@yarn
	@touch node_modules

bootstrap: node_modules

deploy-s3:
	@AWS_PROFILE=personal-account $(BIN)/s3-website deploy src -d samuelfullerthomas.com

invalidate:
	@AWS_PROFILE=personal-account $(BIN)/cf-invalidate -- E1NWLDWN95JGNF index.html style.css error.html shift-change.html downloads.html ppw-to-ppm.html

deploy: deploy-s3 invalidate
