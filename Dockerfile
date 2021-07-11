FROM uselagoon/node-10:21.6.0

ENV DRUPAL_NODE_VER=1.0.13

WORKDIR /usr/src/app

ENV NODE_PORT 8080

RUN set -ex; \
    \
    npm install "drupal-node.js@~${DRUPAL_NODE_VER}"

EXPOSE 8080

WORKDIR /usr/src/app/node_modules/drupal-node.js/

COPY templates/ /usr/src/app/node_modules/drupal-node.js/
COPY entrypoints/ /lagoon/entrypoints/

ENV LAGOON_LOCALDEV_HTTP_PORT=8080

ENTRYPOINT ["/sbin/tini", "--", "/lagoon/entrypoints.sh"]
CMD ["node", "app.js"]
