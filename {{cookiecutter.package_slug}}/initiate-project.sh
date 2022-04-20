#/usr/bin/env bash

python -m venv --upgrade-deps .venv

. .venv/bin/activate

poetry add -D pytest pylint mypy black flake8 isort

poetry install

git init

pre-commit install

git add --all

git commit -m "🎉 Make initial commit from cookiecutter project"
