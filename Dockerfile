FROM node:12.16.1-alpine3.11

LABEL version="0.0.1"
LABEL maintainer="ocular-d <sven@ocular-d.tech>" \
      org.label-schema.vendor="Ocular-d" \
      com.github.actions.name="Remark Action" \
      com.github.actions.description="Validate your Markdown with remarklint" \
      com.github.actions.icon="check-square" \
      com.github.actions.color="green"

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
