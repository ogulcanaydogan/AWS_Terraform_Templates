FMT_DIRS := modules templates

.PHONY: fmt validate

fmt:
	terraform fmt -recursive $(FMT_DIRS)

validate:
	./scripts/terraform-validate.sh
