## The Repo of Helm Charts for Choppy Platform
Don't set ingress for services which have not auth module. You can add ingress by using the following template. After add ingress, all traffic will be forward to kong firstly.
```
echo "apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: demo
  annotations:
    plugins.konghq.com: ldap-auth
spec:
  rules:
  - http:
      paths:
      - path: /foo
        backend:
          serviceName: httpbin
          servicePort: 80" | kubectl apply -f -
```

### Install Fission
```
helm install --name fission -f configs/fission/config.yaml charts/fission-all
```

More Details at [https://github.com/fission/fission/tree/master/charts](https://github.com/fission/fission/tree/master/charts)