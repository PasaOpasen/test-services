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

    if echo "$loc" | grep ':' &> /dev/null
    then
        copy=scp
    else
        copy=cp
    fi

    for s in 'role-id' 'secret-id'
    do 
        $copy output/$s $loc/$s
    done
done
