#! /bin/sh

#
# Note: any changes below should be reflected to `ignoreDeps` in `renovate.json`
#

CLI_PKG_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['prisma'] || pkg?.dependencies?.['prisma'] || pkg?.resolutions?.['prisma'] || '')")
CLIENT_PKG_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/client'] || pkg?.dependencies?.['@prisma/client'] || pkg?.resolutions?.['@prisma/client'] || '')")

INSTRUMENTATION_PKG_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/instrumentation'] || pkg?.dependencies?.['@prisma/instrumentation'] || pkg?.resolutions?.['@prisma/instrumentation'] || '')")

ADAPTER_PLANETSCALE_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/adapter-planetscale'] || pkg?.dependencies?.['@prisma/adapter-planetscale'] || pkg?.resolutions?.['@prisma/adapter-planetscale'] || '')")
ADAPTER_PG_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/adapter-pg'] || pkg?.dependencies?.['@prisma/adapter-pg'] || pkg?.resolutions?.['@prisma/adapter-pg'] || '')")
PG_WORKER_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/pg-worker'] || pkg?.dependencies?.['@prisma/pg-worker'] || pkg?.resolutions?.['@prisma/pg-worker'] || '')")
ADAPTER_PG_WORKER_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/adapter-pg-worker'] || pkg?.dependencies?.['@prisma/adapter-pg-worker'] || pkg?.resolutions?.['@prisma/adapter-pg-worker'] || '')")
ADAPTER_NEON_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/adapter-neon'] || pkg?.dependencies?.['@prisma/adapter-neon'] || pkg?.resolutions?.['@prisma/adapter-neon'] || '')")
ADAPTER_LIBSQL_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/adapter-libsql'] || pkg?.dependencies?.['@prisma/adapter-libsql'] || pkg?.resolutions?.['@prisma/adapter-libsql'] || '')")
ADAPTER_D1_VERSION=$(node -e "const pkg = require('./package.json'); console.log(pkg?.devDependencies?.['@prisma/adapter-d1'] || pkg?.dependencies?.['@prisma/adapter-d1'] || pkg?.resolutions?.['@prisma/adapter-d1'] || '')")

CURRENT_DIR=$(pwd)

if [ -n "$CLI_PKG_VERSION" ]; then sed -i "s/$CLI_PKG_VERSION/$1/g" package.json; fi
if [ -n "$CLIENT_PKG_VERSION" ]; then sed -i "s/$CLIENT_PKG_VERSION/$1/g" package.json; fi

if [ -n "$INSTRUMENTATION_PKG_VERSION" ]; then sed -i "s/$INSTRUMENTATION_PKG_VERSION/$1/g" package.json; fi

if [ -n "$ADAPTER_PLANETSCALE_VERSION" ]; then sed -i "s/$ADAPTER_PLANETSCALE_VERSION/$1/g" package.json; fi
if [ -n "$ADAPTER_PG_VERSION" ]; then sed -i "s/$ADAPTER_PG_VERSION/$1/g" package.json; fi
if [ -n "$PG_WORKER_VERSION" ]; then sed -i "s/$PG_WORKER_VERSION/$1/g" package.json; fi
if [ -n "$ADAPTER_PG_WORKER_VERSION" ]; then sed -i "s/$ADAPTER_PG_WORKER_VERSION/$1/g" package.json; fi
if [ -n "$ADAPTER_NEON_VERSION" ]; then sed -i "s/$ADAPTER_NEON_VERSION/$1/g" package.json; fi
if [ -n "$ADAPTER_LIBSQL_VERSION" ]; then sed -i "s/$ADAPTER_LIBSQL_VERSION/$1/g" package.json; fi
if [ -n "$ADAPTER_D1_VERSION" ]; then sed -i "s/$ADAPTER_D1_VERSION/$1/g" package.json; fi
