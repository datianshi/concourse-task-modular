#!/bin/bash

set -e

name=$(cat sample-input/input.json | jq -r .name)
echo $name
echo $PASSWORD

json_template=$(cat << EOF
{
    "name": \$name,
    "password": \$password,
}
EOF
)

json=$(jq -n \
      --arg name "$name" \
      --arg password "$PASSWORD" \
      "$json_template"
)

echo $json > sample-output/output.json
