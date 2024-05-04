#
# moves secrets to special location requires them
#

set -e

loc="$(cat vault-dir)"
if [ -z "$loc" ]
then 
    echo "empty file"
    exit 1
fi

cat vault-dir | while read loc
do
    for s in 'role-id' 'secret-id'
    do 
        scp output/$s $loc/$s
    done
done
