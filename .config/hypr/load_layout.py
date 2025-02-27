#!/run/current-system/sw/bin/python
# Load the Hyprland layout, defaulting to latest in layout history

import argparse
import logging
import os
import json

# TODO logger and log level arg
# TODO log path to log warnings or debug data etc.

def load_layout(filepath, app_set=None):
    # TODO layout file path to load, defaulting to hyprland layout history dir

    # app set ignore case to load from layout
    # Get unique apps & windows
    apps = {}
    for k, v in layout.items():
        app = v['class'].lower()
        if not in apps:
            apps[app] = {k}
        else:
            apps[app].add(k)

    if app_set is None:
        app_set = set(apps)

    # TODO get current open clients to ignore!

    # Start a special workspace to open the apps' windows

    #'hyprctl dispatch togglespecialworkspace'

    # NOTE may be good to open a terminal sized at the correct size
    # that "swallows"/replaced by the target windows at same place
    # and shape. This is how i3wm did it.

    'hyprctl dispatch workspace name:Loading Layout'
    'hyprctl dispatch workspace name:Loading Layout'

    # TODO for each unique app, start the app and wait briefly for opening, then move opened windows to designated locations if in the layout file, otherwise, leave in the temporary workspace for the user to manage.
    for app in app_set:
        # TODO start application, if not already started, otherwise skip, possibly log


        # TODO sleep to wait to laod

        # TODO get new window data
        # contents = 'hyprctl clients | sed "s/\t/  /g"'
        'hyprctl -j clients'

        # TODO Any matching window class and titles get moved to layout's workspace, position, size, etc.
        f'hyprctl dispatch moveworkspacetomonitor {workspace} {monitor}'

        f'hyprctl dispatch movetoworkspacesilent {workspace},address:{address}'

        # TODO any remaining windows sit in scratch space for user to handle manually.

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='load_hypr_layout.py')
    parser.add_argument(
        '-p',
        '--path',
        default='$HOME/.config/hypr/layout_history'
    )
    parser.add_argument(
        '-a',
        '--apps',
        nargs='*',
        help='List of app names to be loaded (case insensitive)',
    )
    parser.add_argument(
        '--log',
        help-'Log file or directory to write any logging to.',
    )
    # TODO Log level

    # TODO workspace arg to force a given layout on a specific workspace.

    args = parser.parse_args()

    load_layout(args.filepath, set(args.apps))
