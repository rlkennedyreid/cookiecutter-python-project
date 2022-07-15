# Python project template
A poetry-based python-project template with settings and tools that I typically use.

## Requirements
- [poetry](https://python-poetry.org/docs/)
- [cookiecutter](https://github.com/cookiecutter/cookiecutter)
- [pre-commit](https://github.com/pre-commit/pre-commit) - *(Optional)*
- [gitmoji-cli](https://github.com/carloscuesta/gitmoji-cli) - *(Optional)* 🎉

## Features
### Formatting, Linting and Testing
- [black](https://github.com/psf/black)
- [isort](https://github.com/PyCQA/isort)
- [flake8](https://github.com/PyCQA/flake8)
- [pylint](https://github.com/PyCQA/pylint)
- [mypy](https://github.com/python/mypy)
- [pytest](https://github.com/pytest-dev/pytest)

[taskipy](https://pypi.org/project/taskipy/) is used to run these tools in pre-commit hooks and the CI/CD.
**Note:** These tools are not already defined in `pyproject.toml` automatically.
This is to ensure that the tools are up to date when starting the project.

See [below](#initialise-the-project) for details on initialising the project, which includes adding these dev dependencies.


### CI/CD
Working [GitHub Actions](https://docs.github.com/en/actions) workflows that run formatting and linting checks, and tests.

Working [dependabot](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/configuration-options-for-dependency-updates#about-the-dependabotyml-file) config that checks for updates in poetry depencies and GitHub Actions on the main branch.

### pre-commit
Working [pre-commit](https://pre-commit.com/) hooks to run formatting and linting checks.

## Layout
- [src layout](https://blog.ionelmc.ro/2014/05/25/python-packaging/)
- [PEP 518](https://www.python.org/dev/peps/pep-0518) compliance where possible (see [pyproject.toml]({{cookiecutter.package_name}}/pyproject.toml) and [setup.cfg]({{cookiecutter.package_name}}/setup.cfg))
- Python virtual environment assumed to be in root directory by [vscode settings]({{cookiecutter.package_name}}/.vscode)

## Usage

### Run cookiecutter
```bash
cookiecutter gh:rlkennedyreid/cookiecutter-python-project
```

### Initialise the project
[A bash script]({{cookiecutter.package_name}}/initiate-project.sh) is included in the root directory of the project to carry out initial configuration. You can run this, or use it as a reference to set up your project.

The script does the following:
- Creates a virtual environment using [venv](https://docs.python.org/3/library/venv.html)
- Adds dev dependencies to the project
- Installs the project into the virtual environment
- Initialises a git repository
- Installs pre-commit hooks to the git repository
    - *This is skipped if pre-commit is not available*
- Installs gitmoji hooks to the git repository
    - *This is skipped if gitmoji is not available*


Executing the script using [`source/.`](https://www.gnu.org/software/bash/manual/bash.html#index-source) is recommended, as the python virtual environment will be activated for the current shell on completion.

**Note:** The script assumes the `python` in your `PATH` is the correct version.
