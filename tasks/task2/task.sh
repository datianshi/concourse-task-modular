#!/bin/bash

set -ex

NAME=$(cat input/name-password.json | jq -r .name)
PASSWORD=$(cat input/name-password.json | jq -r .password)



json_template=$(cat << EOF
{
    "name": \$name,
    "password": \$password,
    "address": \$address
}
EOF
)

json=$(jq -n \
      --arg name "$NAME" \
      --arg password "$PASSWORD" \
      --arg address "$ADDRESS" \
      "$json_template"
)

echo $json > output-name-address-json/name-password-address.json
