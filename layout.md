I piped this into https://carbon.now.sh to get the screenshot ^^

```
# polygot-template

# source code				      # necessary infrastructure
src/core/*                     |  infra/start.sh
src/tests/*                    |  infra/build.sh
                               |  infra/test.sh
                               |  infra/clean.sh

# common local dev entrypoint     # config
Makefile                       |  repo.yml
```
