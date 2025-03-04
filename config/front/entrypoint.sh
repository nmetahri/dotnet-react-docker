#!/bin/bash

git config --global --add safe.directory $(pwd)

pnpm install --frozen-lockfile --ignore-scripts --unsafe-perm
pnpm run dev