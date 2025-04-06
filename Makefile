-include .env

CHDIR ?= $(shell pwd)

DOCS_OUTPUT  ?= README.md
DOCS_CONTEXT ?= .

.PHONY: all format docs valid package

apply:
	terraform -chdir="$(CHDIR)" apply

docs:
	terraform-docs markdown document --output-file $(DOCS_OUTPUT) --output-mode inject $(DOCS_CONTEXT)

format:
	terraform -chdir="$(CHDIR)" fmt

package:
	@make format
	@make docs

plan:
	terraform -chdir="$(CHDIR)" plan

valid:
	terraform -chdir="$(CHDIR)" validate