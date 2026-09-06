# Jupyter Lab for the Anthropic course notebooks.
#
# Always launched from the repo root: that way every course folder is browsable
# in one session, and `load_dotenv()` in a notebook walks up to the root .env.
#
# Override the environment with: make lab VENV=path/to/.venv

VENV   ?= building_with_claude_api/.venv
PYTHON := $(VENV)/bin/python
LAB    := $(VENV)/bin/jupyter-lab

.DEFAULT_GOAL := help
.PHONY: help lab install

help: ## Show available targets
	@grep -hE '^[a-z-]+:.*##' $(MAKEFILE_LIST) \
		| awk -F':.*## ' '{ printf "  make %-9s %s\n", $$1, $$2 }'

lab: | $(LAB) ## Start Jupyter Lab at the repo root
	$(LAB)

install: | $(PYTHON) ## Install notebook dependencies into the venv
	$(PYTHON) -m pip install anthropic python-dotenv jupyterlab

# Sentinel is jupyter-lab, not jupyter: the plain `jupyter` binary ships with
# jupyter_core and exists without Jupyter Lab being installed.
$(LAB): | $(PYTHON)
	$(PYTHON) -m pip install jupyterlab

$(PYTHON):
	@echo "No virtualenv at $(VENV)." >&2
	@echo "Create one with:  python3 -m venv $(VENV)" >&2
	@echo "Or point at another:  make lab VENV=path/to/.venv" >&2
	@exit 1
