.PHONY: package generate-index clean-charts

generate-index: clean-charts package
	@echo ""
	@echo "Generate helm chart index..."
	@cd docs && helm repo index ./ --url https://go-choppy.github.io/choppy-helm-charts/

package:
	@echo "Package all helm charts..."
	@bash package.sh

install-kong:

clean-charts:
	@echo "Clean docs directory"
	rm -rf ./docs/*
