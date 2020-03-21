FROM node:12.16.1-alpine3.11

LABEL "maintainer"="ocular-d"

COPY package.json package-lock.json .remarkrc.yaml ./

RUN apk add --no-cache bash=~5.0.11-r1 \
    && npm install --no-cache \
    && npm link remark-cli


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

