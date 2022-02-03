#/usr/bin/env bash

git init

pre-commit install

python -m venv --upgrade-deps .venv

. .venv/bin/activate

poetry install

git add --all

git commit -m "Make initial commit from cookiecutter project"
