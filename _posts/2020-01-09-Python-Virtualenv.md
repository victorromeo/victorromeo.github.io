---
layout: post
title: "Python workspace setup and virtualenv"
date: 2020-01-09
tags: python environment
image: https://images.unsplash.com/photo-1570741066052-817c6de995c8
thumb: https://images.unsplash.com/photo-1570741066052-817c6de995c8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@lennykuhne
type: concept
---

Python projects use packages to extend the base language set. Both virtualenv and pipenv provide a way to manage the packages in a project

<!-- markdownlint-disable MD033 -->

<style>
    table {
        width:100%;
        margin-left: 30px;
    }
    table th:first-of-type {
        width:40%;
    }
</style>

- [Background](#background)
- [Pre-requisites](#pre-requisites)
  - [PIPENV setup](#pipenv-setup)
  - [VIRTUALENV setup](#virtualenv-setup)
- [Project Setup (Linux)](#project-setup-linux)
  - [Create the project directory](#create-the-project-directory)
  - [Create GIT repository](#create-git-repository)
  - [Managing Project Packages via virtualenv](#managing-project-packages-via-virtualenv)
  - [Managing Project Packages via pipenv](#managing-project-packages-via-pipenv)
  - [Environment consistency with virtualenv or pipenv](#environment-consistency-with-virtualenv-or-pipenv)
  - [Project Hierarchy](#project-hierarchy)

## Background

- **virtualenv** creates a sandbox inside a project folder which contains the package cache
  - Packages are securely encapsulated inside the project folder
  - Multiple copies of a project therefore can exist side-by-side in separate folders, where packages can be independently verified
- **pipenv** stores a cache of packages which a project can use, using _virtualenv_ under the covers to manage project package dependencies
  - Using pipenv _locally_ ensures that only the current user can access the packages _(Recommended)_
  - Using pipenv _globally_ provides system-wide access to the libraries
  - Creates a Pipfile which contains a list of the Python project requirements
  - Creates a Pipfile.lock file which specifies the versions of each package that should be used

## Pre-requisites

1. Install Python 3 _globally_ `sudo apt install python3`

2. Install pip3 _globally_ `sudo apt install pip3`

### PIPENV setup

1. Install **pipenv** _locally_ `pip install --user pipenv`

2. As the user bin path to python is not accessible globally, and not defined by the installation, add the following into the `~/.profile` file to declare the path to python

    ```bash
    # add Python pip and pipenv paths
    PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
    if [ -d "$PYTHON_BIN_PATH" ] ; then
      PATH="$PATH:$PYTHON_BIN_PATH"
    fi
    ```

### VIRTUALENV setup

1. Install **virtualenv** _globally_ `sudo pip install virtualenv`, which allows other host users to use virtualenv also

## Project Setup _(Linux)_

### Create the project directory

1. Create the project directory `mkdir <project_dir>`

2. Change to the project directory `cd <project_dir>`

### Create GIT repository

1. Create a local git repository `git init`

2. Create a git ignore file `touch .gitignore`

### Managing Project Packages via _**virtualenv**_

<div class="alert alert-warning">These operations are on the project, and the command should only be run from within the project root folder.</div>

Operation | Command
----|-----
Get version | `virtualenv --version`
Create virtual environment _venv_ (or any other name) | `virtualenv venv`
Activating a virtual environment, _(use when not activated already)_ | `source venv/bin/activate`
Leave the virtual environment | `deactivate`
Delete a virtual environment | `rm -rf venv`

### Managing Project Packages via _**pipenv**_

<div class="alert alert-warning">These operations are on the project, and may modify the cache. Only run these commands from within the project root folder.</div>

Operation | Command
----|-----
Create a pipenv enabled environment | `pipenv install`
Open a shell for the environment | `pipenv shell`
Exit the shell | `exit`
_**Add**_ a package | `pipenv install <package_name>`
_**Remove**_ a package | `pipenv uninstall <package_name>`
_**Update**_ a package | `pipenv update <package_name>`
Run a project outside the environment shell | `pipenv run python3 <python_file.py>`
Run a project inside the environment shell | `python3 <python_file.py>`
Clean the package cache, removing packages found which are not in the Pipfile.lock | `pipenv clean`

### Environment consistency with _**virtualenv**_ or _**pipenv**_

Operation | Command
----|-----
Freeze packages creates a file which lists the packages | `pip freeze > requirements.txt`
Install requirements from a freeze list | `pip install -r requirements.txt`

### Project Hierarchy

If your project contains subfolders which contain python scripts which cross reference other folders, accessing those folders requires a root python folder.

1. In the root folder create an empty init file `touch __init__.py`
