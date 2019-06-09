# polygot-template

a template for doing work in any given language, using local docker

## `./*` (overview)

```
# source code
src/core/*
src/tests/*

# common local dev entrypoint
Makefile

# necessary infrastructure
infra/start.sh
infra/build.sh
infra/test.sh
infra/clean.sh

# config
repo.yml
```

## `src/*` (source code)

All of the code that's intrinsically linked to the fundamental purpose of your repo? That's "source", and it goes in `src/*`. It should have two sub-folders:

- `src/core/*` (core logic and functionality)
- `src/tests/*` (tests for `src/core/*`)

Some languages (like `golang`) like to keep unit tests next to the core code, and have a naming pattern like

```
src/core/application/logic_test.go
src/core/application/logic_test.py
```

Do totally keep them there! In cases like that, your `src/tests` folder is used for _end to end tests_ and their relatives.

## `Makefile` (common local dev entrypoint)

Makefiles are (in our usage) a special case. They're formatted in a way that's great for visually scanning through them, if you choose to use them for that purpose.

Our makefiles focus on the common commands that new / returning developers need to run. Those commands should have well known names and always come with humanized descriptions. Anything that's hyper-special-purpose or hard to describe should go inside a `infra/*.sh` and not get a makefile target.

In our dockerized local dev world, the makefile mostly contains calls to bash and docker.

## `infra/*` (necessary infrastructure)

All of the code that's required to _accomplish your goals_ but not necessarily _directly related to your particular repo_? That's "infrastructure", and it goes in `infra/*`. You'll want the following (distinct) infra scripts

- `infra/startup.sh` (startup a local container)
- `infra/build.sh` (run local build processes)
- `infra/test.sh` (run local tests, likely calls out to `src/tests`)
- `infra/clean.sh` (cleanup files and assets)

You will _definitely_ want to add many many more special purpose infra scripts as the needs for your application grow.

## `repo.yml` (config)

Try to centralize your infrastructure configuration into one place, rather than letting it become scattered across your many script files. Add anything you need here, this repo includes some basic polygot template basics.

- `name` (the name of your repo)
- `baseImage` (a necessary component of our polygot dockerized world)
