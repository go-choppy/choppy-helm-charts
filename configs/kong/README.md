## Configuration for Kong Plugin
### The Template of Ingress
```
apiVersion: extensions/v1beta1
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
          servicePort: 80
```

### The Template of LDAP Plugin
```
apiVersion: configuration.konghq.com/v1
kind: KongPlugin
metadata:
  name: ldap-auth
config: 
  hide_credentials: true
  ldap_host: ldap.3steps.cn
  ldap_port: 389
  start_tls: false
  base_dn: ou=users,dc=3steps,dc=cn
  verify_ldap_host: false
  attribute: cn
  cache_ttl: 60
  header_type: basic
plugin: ldap-auth
```