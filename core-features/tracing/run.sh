#!/bin/sh

set -eux

yarn install
yarn prisma generate

node app.js &
