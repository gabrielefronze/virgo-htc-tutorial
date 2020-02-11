#! /bin/bash

ORIGINAL=$1
NEW=$2

if [[ -z $1 ]]; then
    echo "Usage: set_group.sh <original_username> <new_username>"
    echo "       set_group.sh <new_username> (original username default to albert.einstein)"
    exit 1
fi

if [[ -z $NEW ]]; then
    NEW="$ORIGINAL"
    ORIGINAL="albert.einstein"
fi

echo "Replacing $ORIGINAL with $NEW"

if [ "$(uname)" == "Darwin" ]; then
    grep -rl "accounting_group_user = $ORIGINAL" ./*/*.sub | xargs sed -i '' 's/'"accounting_group_user = $ORIGINAL"'/'"accounting_group_user = $NEW"'/g'
else
    grep -rl "accounting_group_user = $ORIGINAL" ./*/*.sub | xargs sed -i 's/'"accounting_group_user = $ORIGINAL"'/'"accounting_group_user = $NEW"'/g'
fi
