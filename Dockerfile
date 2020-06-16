FROM node:12-alpine3.12

LABEL version="0.0.9"
LABEL maintainer="ocular-d <sven@ocular-d.tech>" \
      org.label-schema.vendor="Ocular-d" \
      com.github.actions.name="Remark Action" \
      com.github.actions.description="Validate your Markdown with remarklint" \
      com.github.actions.icon="check-square" \
      com.github.actions.color="green"

RUN mkdir -p /srv/app/node_modules && chown -R node:node /srv/app \
    && apk add --no-cache git bash

WORKDIR /srv/app

COPY --chown=node:node package*.json ./
COPY --chown=node:node entrypoint.sh /srv/app/entrypoint.sh

USER node

RUN npm install \
    && chmod +x entrypoint.sh

#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
ENTRYPOINT ["/bin/bash"]