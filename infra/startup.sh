#!/bin/bash

set -euo pipefail
set -o xtrace

name=$1

#!/bin/bash

# This script sets up a local build environment meant for rapid iteration
# that matches the containerized build that'll be happening on CircleCI.

set -euo pipefail
set -o xtrace

name=$1

function dockerRun() {
   baseImage=$(yq r repo.yml baseImage)
   # run the container
   docker run \
      -itd \
      --name "$name" \
      --mount type=bind,src="$(pwd)",dst=/repo \
      --workdir /repo \
      "$baseImage"
}

# check if there is a running containers with our name
runningContainersWithOurName=$(docker ps --filter "name=$name")
if [[ ! $runningContainersWithOurName =~ $name ]]
then
   # there is *not* a running container with our name...
   # so we create one
   dockerRun
fi

# TODO: container cache busting!

# container is up! now we can `docker exec` in other scripts
