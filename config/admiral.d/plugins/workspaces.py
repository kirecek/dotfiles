#!/usr/bin/env python3
# vim: set syntax=python:
# -*- coding: utf-8 -*-
'''
workspaces
~~~~~~~~~~
'''


from collections import namedtuple

import i3ipc
import sys


I3 = i3ipc.Connection()

COLORS = namedtuple('Colors', 'ACTIVE INACTIVE URGENT')(
    '%{F#5E468C}',
    '%{F#555555}',
    '%{F#BF4D80}',
)


def trim_tag_from_name(name: str):
    tmp = name.split(':')
    return ''.join(tmp[1:]) if len(tmp) > 1 else name


def workspace_listener(self, event=None):

    output = ''

    for ws in I3.get_workspaces():
        color = COLORS.INACTIVE
        if ws['focused'] is True:
            color = COLORS.ACTIVE
        elif ws['focused'] is True:
            color = COLORS.URGENT
        output += '{0}{1} '.format(
            color, trim_tag_from_name(ws['name'])
        )

    print(output)
    sys.stdout.flush()


def main():
    workspace_listener(None)

    I3.on('workspace', workspace_listener)
    I3.main()

main()
