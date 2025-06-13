##@ General

# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk commands is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI control characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php

.PHONY: help
help: ## Display this help.
	@awk '\
		BEGIN { \
			FS = ":.*##"; \
			printf "\nUsage:\n  make \033[36m<target>\033[0m\n" \
		} \
		/^[a-zA-Z_0-9-]+:.*?##/ { \
			target = $$1; \
			help_msg = $$2; \
			gsub(/`[^`]+`/, "\033[32m&\033[0m", help_msg); \
			gsub(/`/, "", help_msg); \
			printf "  \033[36m%-15s\033[0m %s\n", target, help_msg \
		} \
		/^##@/ { \
			printf "\n\033[1m%s\033[0m\n", substr($$0, 5) \
		} \
	' $(MAKEFILE_LIST)

##@ Development

SRC_LIST := $(shell find src -type f -name "Chart.yaml" -exec dirname {} \;)

.PHONY: index
index: ## Generate the Helm chart index file.
	helm repo index .

.PHONY: lint
lint: ## Lint the Helm chart.
	@for chart in $(SRC_LIST); do \
		helm lint $$chart; \
	done

.PHONY: docs
docs: ## Generate documentation for the Helm chart.
	@for chart in $(SRC_LIST); do \
		helm-docs -c $$chart -s file; \
	done
