#/usr/bin/env bash

git init

pre-commit install

python -m venv --upgrade-deps .venv

. .venv/bin/activate

poetry add -D pytest pylint mypy black flake8 isort

poetry install

git add --all

git commit -m "🎉 Make initial commit from cookiecutter project"
