# dotfiles

[![Build Status](https://travis-ci.org/kirecek/dotfiles.svg?branch=master)](https://travis-ci.org/kirecek/dotfiles)

> with ansible, for archlinux

Configure entire linux environment in one command.

## Prerequisites

- git
- python

## Dependencies

```shell
$ pip install --user ansible
```

# Installation

Clone this repository:

```shell
$ git clone git@github.com:kirecek/dotfiles.git && cd dotfiles
```

Run ansible playbook:

```shell
$ ansible-playbook playbook.yml
```

**That's it!**
