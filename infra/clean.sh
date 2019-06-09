#!/bin/bash

set -euo pipefail
set -o xtrace

name=$1

docker rm "$name" -f
