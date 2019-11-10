.PHONY: tar generate-index

generate-index: tar
	@echo ""
	@echo "Generate helm chart index..."
	@cd docs && helm repo index ./ --url https://choppy-helm-charts.github.io

tar:
	@echo "Package all helm charts..."
	@bash tar.sh
