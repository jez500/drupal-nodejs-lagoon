FROM uselagoon/node-10:21.6.0

ENV DRUPAL_NODE_VER=1.0.13
ENV FOREVER_NODE_VER=4.0.1

WORKDIR /usr/src/app

ENV NODE_PORT 8080

RUN set -ex; \
    \
    npm install "drupal-node.js@~${DRUPAL_NODE_VER}" \
    && npm install "forever@${FOREVER_NODE_VER}" -g

EXPOSE 8080

WORKDIR /usr/src/app/node_modules/drupal-node.js/

COPY templates/ /usr/src/app/node_modules/drupal-node.js/
COPY entrypoints/ /lagoon/entrypoints/
COPY scripts/ /bin/

RUN chmod +x /bin/drupal-node-start.sh

ENV LAGOON_LOCALDEV_HTTP_PORT=8080

ENTRYPOINT ["/sbin/tini", "--", "/lagoon/entrypoints.sh"]
CMD ["/bin/drupal-node-start.sh"]
