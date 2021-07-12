#!/bin/sh

# Replace env vars.
/bin/ep /usr/src/app/node_modules/drupal-node.js/nodejs.config.js

# Run script via forever.
/usr/local/bin/forever start /usr/src/app/node_modules/drupal-node.js/forever.json

# Keep open by tail of logs.
touch /var/log/forever.log
tail -f /var/log/forever.log
