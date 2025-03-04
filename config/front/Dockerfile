FROM node:22-bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends bash git && rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm

WORKDIR /app

RUN chown -R node:node /app

USER node

COPY --chown=node:node --link --chmod=755 ./entrypoint.sh /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
