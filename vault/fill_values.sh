
# export VAULT_ADDR='http://0.0.0.0:8200'
export VAULT_ADDR='http://vault.db:8200'

vault login root

vault kv put secret/pyrus PYRUS.creds.login=plogin PYRUS.creds.security_key=skey
vault kv put secret/rpa USER=user PASSWORD=passwd
vault kv put secret/docutable DOCA.SOMETHING=SOMETHING


