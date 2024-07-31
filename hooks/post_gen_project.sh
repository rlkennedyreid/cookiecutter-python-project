#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

function echo_green() {
    local GREEN='\033[0;32m'
    local NOCOLOUR='\033[0m'
    echo -e "${GREEN}${1}${NOCOLOUR}"
}

echo_error() {
    local RED='\033[0;31m'
    local NOCOLOUR='\033[0m'
    echo -e "${RED}${1}${NOCOLOUR}" 1>&2
}

echo_green "Initiating project..."

# Which is crazier:
# 1. Running a bash script in Python using subprocess
# 2. Running a python script in bash using a here document
# 3. Being too lazy to write a simple bash script to rename files for a consistent startup hook?

python - <<'END'
# https://github.com/cookiecutter/cookiecutter/issues/1601

# Create a "hooks" directory at the root of your Cookiecutter project, then add this file to it.
import os


for path, subdirs, files in os.walk("."):
    for name in files:
        if name.endswith(".j2"):
            os.rename(os.path.join(path, name), os.path.join(path, name.rstrip(".j2")))

END

if [ -x "$(command -v python)" ] && [ -x "$(command -v poetry)" ] && [ -x "$(command -v git)" ]; then

    echo_green "Creating python virtual environment with venv..."
    python -m venv --clear --upgrade-deps .venv

    echo_green "Activating virtual environment..."
    . .venv/bin/activate

    echo_green "Add development dependencies to project..."
    poetry add --lock -n --group dev pytest pylint mypy ruff taskipy

    echo_green "Add production dependencies to project..."
    poetry add --lock -n pydantic[dotenv] pydantic-settings typer[all]

    echo_green "Installing project..."
    poetry install -n

    echo_green "Initialising git..."
    git init


    if [ -x "$(command -v pre-commit)" ]; then
        echo_green 'Installing pre-commit hooks...'
        pre-commit install
    fi

    echo_green "Making first commit..."
    git add --all && git commit -m "🎉 Make initial commit from cookiecutter project"

    if [ -x "$(command -v gitmoji)" ]; then
        echo_green 'Installing gitmoji hook...'
        gitmoji -i
    fi
else
    echo_error 'Error: Required dependencies not found. Need: [python, poetry, git]'
    return 1
fi

unset -f echo_green echo_error
