create:
	helm install jupyterhub/binderhub --version=0.2.0-b9ed7f5  --name=binderhub -f secret.yaml -f config.yaml --namespace jupyterhub

purge:
	helm del --purge binderhub
	kubectl delete pods,secrets --all -n jupyterhub

upgrade:
	helm upgrade binderhub jupyterhub/binderhub --version=0.2.0-3b53fce -f secret.yaml -f config.yaml --namespace jupyterhub