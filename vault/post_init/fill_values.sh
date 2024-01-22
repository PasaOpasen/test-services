
set -e

export VAULT_ADDR='http://0.0.0.0:8200'
# export VAULT_ADDR='http://vault.db:8200'

# export VAULT_NAMESPACE=admin

vault login root
vault policy write admin /post_init/admin-policy.hcl

vault secrets enable -path=custom/path kv
vault secrets enable -path=other kv

#################
#
# FILL VALUES
#
#################

vault kv put secret/pyrus PYRUS.creds.login=plogin PYRUS.creds.security_key=skey
vault kv put secret/rpa USER=user PASSWORD=passwd
vault kv put secret/docutable DOCA.SOMETHING=SOMETHING

vault kv put secret/web OIDC_RP_CLIENT_ID=test-client \
    OIDC_RP_CLIENT_SECRET='AteFCNHKpYbyI3eutCSwE6br3VFAxtO8' \
    OIDC_RP_SIGN_ALGO=RS256

vault kv put secret/hl HOTFOLDER.inpath=docs-map.yaml

vault kv put secret/pyin DOCTYPE_OVERRIDES.bankruptcy.DREAMDOCS.INFO.DOCSET=bankrotstvo-zaiavlenie-test


vault kv put custom/path/some/key K=V KK=VV
vault kv put other/some/key K=V KK=VV
vault kv put other/newkey K=V KK=VV


#
# auth methods
#

vault auth enable userpass
vault write auth/userpass/users/myusername password=mypassword policies=admin

# vault login -method=userpass username=myusername password=mypassword

vault auth enable approle

vault write auth/approle/role/custom-role \
    secret_id_ttl=0m \
    token_num_uses=0 \
    token_ttl=0m \
    token_max_ttl=0m \
    secret_id_num_uses=0 \
    policies="admin"


vault read auth/approle/role/custom-role/role-id \
    | tee /dev/fd/2 | grep role_id \
    | awk '{print $2}' | tr -d '\n' > /out/role-id.txt

vault write -f auth/approle/role/custom-role/secret-id \
    | tee /dev/fd/2 | grep -E 'secret_id\s' \
    | awk '{print $2}' | tr -d '\n' > /out/secret-id.txt

# vault write auth/approle/login \
#     role_id=18035f28-e0a1-d811-d439-6df236f5dfd9 \
#     secret_id=95b0f4d4-fdae-da7e-6580-0f516f69c27b
