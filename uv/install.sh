#! /bin/bash -e

# https://docs.astral.sh/uv/getting-started/installation/

curl -LsSf https://astral.sh/uv/install.sh | sh

ource $HOME/.local/bin/env

uv --version