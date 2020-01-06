# Prisma e2e tests [![Actions Status](https://github.com/prisma/prisma2-e2e-tests/workflows/test/badge.svg)](https://github.com/prisma/prisma2-e2e-tests/actions?query=workflow%3Atest)

This repository continuously tests PhotonJS on various operating systems, frameworks and platforms.

You can check out the latest test runs by checking the ["test" workflow results](https://github.com/prisma/prisma2-e2e-tests/actions?query=workflow%3Atest).

## How it works

A Github Action continuously checks if there is a new alpha release of prisma2. This action is defined in `.github/workflows/upgrade.yaml` and runs every 5 minutes (that's the shortest interval Github allows).

If there is a new version, [Prismo](https://github.com/prisma-bot) works tirelessly to commit and push a bump commit, triggering the e2e tests. This is implemented in `.github/workflows/upgrade.yaml` using a Github Action cron job. Since the cron job is limited to run each 5 minutes, we just run each cron job for exactly 5 minutes and check for updates each 10 seconds in each run. This check only runs in the default branch `master`.

The e2e tests are defined in `.github/workflows/test.yaml`. Currently, this action tests:

- Operating Systems: Linux, Mac, Windows
- Node versions: 8, 10, 12
- Frameworks (see `frameworks/`)
- Platforms (see `platforms/`)

To check the current status of this repository somewhere else, you can use [a simple shell script](https://gist.github.com/steebchen/80fb6e3a60aec0f095090618f90473ec).

## How to add or adapt platforms

Every folder with a run.sh script gets tested. run.sh is the entrypoint, and you can do whatever you want in that file. Exitting with zero means your tests passed, everything non-zero equals to failing tests. 

You should use [yarn](https://yarnpkg.com) as it's used for bumping dependencies; i.e. run `yarn install` as a first step in your run.sh script.

**NOTE:**
It's important to add `prisma2` as a devDependency and `@prisma/photon` as a normal dependency in each project's package.json.
