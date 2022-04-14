# Python project template
A poetry-based python-project template with settings and tools that I typically use.

## Requirements
- [poetry](https://python-poetry.org/docs/)
- [cookiecutter](https://github.com/cookiecutter/cookiecutter)
- [pre-commit](https://github.com/pre-commit/pre-commit) - *optional*

## Features
### Formatting, Linting and Testing
- [black](https://github.com/psf/black)
- [isort](https://github.com/PyCQA/isort)
- [flake8](https://github.com/PyCQA/flake8)
- [pylint](https://github.com/PyCQA/pylint)
- [mypy](https://github.com/python/mypy)
- [pytest](https://github.com/pytest-dev/pytest)

### CI/CD
Working [GitHub Actions](https://docs.github.com/en/actions) workflows that run formatting and linting checks, and tests.

Working [dependabot](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/configuration-options-for-dependency-updates#about-the-dependabotyml-file) config that checks for updates in poetry depencies and GitHub Actions on the main branch.

### pre-commit
Working [pre-commit](https://pre-commit.com/) hooks to run formatting and linting checks.

## Layout
- [src layout](https://blog.ionelmc.ro/2014/05/25/python-packaging/)
- [PEP 518](https://www.python.org/dev/peps/pep-0518) compliance where possible (see [pyproject.toml]({{cookiecutter.package_slug}}/pyproject.toml) and [setup.cfg]({{cookiecutter.package_slug}}/setup.cfg))
- Python virtual environment assumed to be in root directory by [vscode settings]({{cookiecutter.package_slug}}/.vscode)

## Usage

```bash
cookiecutter gh:rlkennedyreid/cookiecutter-python-project
```

[A bash script]({{cookiecutter.package_slug}}/initiate-project.sh) is included in the root directory of the project to carry out initial config.
