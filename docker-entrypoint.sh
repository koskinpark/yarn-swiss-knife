#!/bin/sh
cd /app/project

mkdir -p npm-packages-offline-cache
cp -RT /app/npm-packages-offline-cache/ ./npm-packages-offline-cache/

# first offline load basic packages.
yarn install --ignore-optional --offline

# if new were added
yarn check || yarn install --ignore-optional --check-files
exec "$@"
