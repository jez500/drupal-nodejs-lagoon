## Overview

Server app [beejeebus/drupal-nodejs](https://github.com/beejeebus/drupal-nodejs) for the [Node.js Integration Drupal module](https://www.drupal.org/project/nodejs) based on [Lagoon node 10 image](https://github.com/uselagoon/lagoon-images/tree/main/images/node)

Inspiration from [wodby/drupal-node](https://github.com/wodby/drupal-node) with same env vars reused.

## Environment variables 

| Variable                             | Default Value     | Description |
| ------------------------------------ | ----------------- | ----------- |
| `NODE_BACKEND_BASE_PATH`             |                   |             |
| `NODE_BACKEND_HOST`                  | `nginx`           |             |
| `NODE_BACKEND_PORT`                  | `80`              |             |
| `NODE_BACKEND_SCHEME`                | `http`            |             |
| `NODE_BASE_AUTH_PATH`                |                   |             |
| `NODE_CLIENTS_CAN_WRITE_TO_CLIENTS`  | `false`           |             |
| `NODE_CLIENTS_CAN_WRITE_TO_CHANNELS` | `false`           |             |
| `NODE_DEBUG`                         | `1`               |             |
| `NODE_JS_ETAG`                       | `true`            |             |
| `NODE_JS_MINIFICATION`               | `true`            |             |
| `NODE_LOG_LEVEL`                     | `1`               |             |
| `NODE_MESSAGE_PATH`                  | `/nodejs/message` |             |
| `NODE_RESOURCE`                      | `/socket.io`      |             |
| `NODE_SCHEME`                        | `http`            |             |
| `NODE_SERVICE_KEY`                   |                   |             |
| `NODE_SSL_CA_PATH`                   |                   |             |
| `NODE_SSL_CERT_PATH`                 |                   |             |
| `NODE_SSL_KEY_PATH`                  |                   |             |

## Scripts

This uses [forever](https://www.npmjs.com/package/forever) to keep the service
running, manually starting via forever can be done by executing `/bin/drupal-node-start.sh`.

## Development environment

Tested with [Lando](https://lando.dev/) dev environment

Example of additions to `.lando.yml`

```
services:
  node:
    type: node:custom
    app_mount: false
    command: /bin/drupal-node-start.sh
    overrides:
      image: doghouseau/drupal-nodejs-lagoon:latest
      environment:
        NODE_SERVICE_KEY: __MY_KEY__
        NODE_BASE_AUTH_PATH: /nodejs/
        NODE_BACKEND_HOST: website.lndo.site
        NODE_BACKEND_PORT: 80
        NODE_DEBUG: 'true'

proxy:
  node:
    - sockets.website.lndo.site:8080
```
