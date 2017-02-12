dotfiles
========

    with ansible for archlinux

Configure entire linux environment in one command.

Dependencies
~~~~~~~~~~~~

Since everything is managed by ansible_, you need only ansible.

.. _ansible: http://docs.ansible.com/ansible/

::

    pip install --user ansible

Installation
~~~~~~~~~~~~

Clone this repository:
::

    git clone git@github.com:kirecek/dotfiles.git && cd dotfiles

Run ansible playbook:
::

    ansible-playbook playbook.yml

**That's it!**
