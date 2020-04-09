FROM node:12.16.1-alpine3.11

LABEL "maintainer"="ocular-d"

RUN npm install -g \
        remark-cli \
        remark-lint \
        remark-preset-lint-consistent \
        remark-preset-lint-markdown-style-guide \
        remark-preset-lint-recommended \
        remark-validate-links \
    && apk add --no-cache git~=2.24 bash

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
