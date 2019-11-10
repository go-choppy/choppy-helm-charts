.PHONY: tar generate-index

generate-index: tar
	@echo ""
	@echo "Generate helm chart index..."
	@cd docs && helm repo index ./ --url https://go-choppy.github.io/choppy-helm-charts/

tar:
	@echo "Package all helm charts..."
	@bash tar.sh
