#! /bin/bash

ORIGINAL=$1
NEW=$2

if [[ -z $1 ]] | [[ -z $2 ]]; then
    echo "Usage: set_group.sh <original_group_name> <new_group_name>"
    exit 1
fi

echo "Replacing $ORIGINAL with $NEW"

if [ "$(uname)" == "Darwin" ]; then
    grep -rl "accounting_group = $ORIGINAL" ./*/*.sub | xargs sed -i '' 's/'"accounting_group = $ORIGINAL"'/'"accounting_group = $NEW"'/g'
else
    grep -rl "accounting_group = $ORIGINAL" ./*/*.sub | xargs sed -i 's/'"accounting_group = $ORIGINAL"'/'"accounting_group = $NEW"'/g'
fi
