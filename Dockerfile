FROM node:12-alpine3.12

LABEL version="0.0.9"
LABEL maintainer="ocular-d <sven@ocular-d.tech>" \
      org.label-schema.vendor="Ocular-d" \
      com.github.actions.name="Remark Action" \
      com.github.actions.description="Validate your Markdown with remarklint" \
      com.github.actions.icon="check-square" \
      com.github.actions.color="green"

RUN npm install -g \
    remark \
    remark-cli \
    remark-preset-lint-consistent \
    remark-preset-lint-markdown-style-guide \
    remark-preset-lint-recommended \
    remark-validate-links \
    remark-lint-list-item-indent \
    && apk add --no-cache git bash

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#ENTRYPOINT ["/bin/bash"]