#! /bin/bash -e

# https://docs.astral.sh/uv/getting-started/installation/

curl -LsSf https://astral.sh/uv/install.sh | sh

source $HOME/.local/bin/env

uv --version
