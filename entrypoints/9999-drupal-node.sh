#!/usr/bin/env bash

set -eo pipefail

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

ep /usr/src/app/node_modules/drupal-node.js/nodejs.config.js
