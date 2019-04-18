#!/bin/bash

set -ex


echo $NAME
echo $PASSWORD

json_template=$(cat << EOF
{
    "name": \$name,
    "password": \$password,
}
EOF
)

json=$(jq -n \
      --arg name "$NAME" \
      --arg password "$PASSWORD" \
      "$json_template"
)

echo $json > output-name-json/name-password.json
