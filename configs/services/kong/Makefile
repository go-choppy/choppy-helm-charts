create:
	helm install --name kong -f config.yaml stable/kong

purge:
	helm del --purge kong

upgrade:
	helm upgrade kong stable/kong -f config.yaml