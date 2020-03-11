# SAML Service Provider Reverse Proxy Server Container

## Run

```
docker run -p443:443 -p80:80 chibiegg/saml-sp-proxy
```


## Environment variables

* NGINX_SERVER_NAME
* SAML_IDP_LOGIN_URL
* SAML_IDP_CERTIFICATE_FILE
* SAML_SP_ENTRY_ID
* SAML_SP_ACS_URL
* SAML_USERNAME_ATTRIBUTE_NAME
