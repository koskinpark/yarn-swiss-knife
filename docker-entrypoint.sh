#!/bin/sh
cd /work/

# Simple copy until https://github.com/yarnpkg/yarn/issues/3724 will resolved
# later in install should be added: `--modules-folder /vendor/node_modules`

if [ ! -d /work/node_modules ]; then
  cp -r /vendor/node_modules /work/node_modules
fi

yarn install --check-files --non-interactive --cache-folder /root/.yarn-cache
exec "$@"
