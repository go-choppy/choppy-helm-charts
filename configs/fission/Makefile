.PHONY: upgrade install

upgrade:
	helm upgrade fission -f config.yaml choppy/fission-all

install:
	helm install --name fission -f config.yaml choppy/fission-all