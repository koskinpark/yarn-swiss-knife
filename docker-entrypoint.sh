#!/bin/sh
cd /app/project

# if new were added
yarn check || yarn install --ignore-optional --check-files
exec "$@"
