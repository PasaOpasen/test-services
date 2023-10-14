
set -e

export VAULT_ADDR='http://0.0.0.0:8200'
# export VAULT_ADDR='http://vault.db:8200'

# export VAULT_NAMESPACE=admin

vault login root
vault policy write admin /post_init/admin-policy.hcl

vault kv put secret/pyrus PYRUS.creds.login=plogin PYRUS.creds.security_key=skey
vault kv put secret/rpa USER=user PASSWORD=passwd
vault kv put secret/docutable DOCA.SOMETHING=SOMETHING


vault auth enable userpass
vault write auth/userpass/users/myusername password=mypassword policies=admin

# vault login -method=userpass username=myusername password=mypassword



