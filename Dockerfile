FROM node:12.16.1-alpine3.11

LABEL "maintainer"="ocular-d"

COPY package.json package-lock.json .remarkrc.yaml /app/

#COPY md /app/md

WORKDIR /app
RUN apk add --no-cache bash=~5.0.11-r1 git~=2.24 \
    && npm install -g --no-cache \
    && npm link remark-cli

#COPY .git /app/.git
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/remark"]
#ENTRYPOINT ["/app/entrypoint.sh"]
#ENTRYPOINT ["bash"]
