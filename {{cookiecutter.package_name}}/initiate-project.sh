#!/usr/bin/env bash

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

if [ -x "$(command -v python)" ] && [ -x "$(command -v poetry)" ] && [ -x "$(command -v git)" ]; then

  echo_green "Creating python virtual environment with venv..."
  python -m venv --upgrade-deps .venv

  echo_green "Activating virtual environment..."
  . .venv/bin/activate

  echo_green "Add development requirements to project..."
  poetry add --lock -n -D pytest pylint mypy black flake8 isort taskipy pydantic[dotenv]

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
fi

unset -f echo_green echo_error
