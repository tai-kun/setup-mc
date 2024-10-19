#!/usr/bin/env bash

set -eu

wget -q https://dl.min.io/client/mc/release/linux-amd64/mc
chmod u+x mc
mv mc /usr/local/bin/

mc alias set "$ALIAS" \
    "$ENDPOINT_URL" \
    "$ACCESS_KEY_ID" \
    "$SECRET_ACCESS_KEY" \
    --api S3v4
