

```sh
curl -H "X-Vault-Request: true" -H "X-Vault-Token: ${VAULT_TOKEN}" http://34.31.183.24:8100/v1/secret/data/pyrus | jq -r .data.data
```