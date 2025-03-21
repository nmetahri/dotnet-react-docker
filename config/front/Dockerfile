FROM node:22-bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends bash git && rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm

WORKDIR /app

RUN mkdir -p /app/node_modules /app/.pnpm-store && \
    chown -R node:node /app /app/node_modules /app/.pnpm-store && \
    chmod -R 755 /app /app/node_modules /app/.pnpm-store

USER node

COPY --chown=node:node --link --chmod=755 ./entrypoint.sh /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
