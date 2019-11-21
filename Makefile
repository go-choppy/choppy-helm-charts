.PHONY: package generate-index

generate-index: package
	@echo ""
	@echo "Generate helm chart index..."
	@cd docs && helm repo index ./ --url https://go-choppy.github.io/choppy-helm-charts/

package:
	@echo "Package all helm charts..."
	@bash package.sh

update-helm:
	helm repo update
