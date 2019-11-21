.PHONY: upgrade install

upgrade:
	helm upgrade keycloak -f config.yaml choppy/keycloak

install:
	helm install --name keycloak -f config.yaml choppy/keycloak