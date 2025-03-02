#!/run/current-system/sw/bin/python
"""
Load the Hyprland layout, defaulting to latest in layout history and assumes
that the layout should not be loaded if the app is already running. This is
primarily for restoring sessions after logging back into a new Hyprland session
where the applications are assumed to restore their prior windows and it is up
to this script to move those windows back into the place they were before. This
is to provide the functionality that is default in every desktop envrionment
that window managers and wayland compositors seem to not provide by default.
"""
# TODO make it load the layout without starting the app
# TODO handle apps that don't save state since last close, but are to be run
# per window, such as most terminals

import argparse
import json
import os
import subprocess

import logging
logger = logging.getLogger(__name__)


# TODO logger and log level arg
# TODO log path to log warnings or debug data etc.


def get_app_to_windows(clients_json, keys=None):
    if keys is None:
        keys = ['class', 'title']
    apps = {}
    for client in clients_json:
        app = client['class'].lower()
        if app not in apps:
            apps[app] = {tuple(client[k] for k in keys): client}
        else:
            # NOTE Will error here if multiple matches!
            apps[app][tuple(client[k] for k in keys)] = client
    return apps


def load_layout(filepath, app_set=None, keys=None):
    # TODO layout file path to load, defaulting to hyprland layout history dir
    if keys is None:
        keys = ['class', 'title']

    # app set ignore case to load from layout
    # Get unique apps & windows
    with open(filepath) as openf:
        apps = get_app_to_windows(json.load(openf))

    # Get current open clients in case useful info
    before_load_apps = get_app_to_windows(
        json.loads(
            subprocess.run(
                ['hyprctl', '-j', 'clients'],
                capture_output=True,
            ).stdout
        )
    )

    # NOTE may be good to open a terminal sized at the correct size
    # that "swallows"/replaced by the target windows at same place
    # and shape. This is how i3wm did it.

    loading_id = 1337

    # TODO for each unique app, start the app and wait briefly for opening, then move opened windows to designated locations if in the layout file, otherwise, leave in the temporary workspace for the user to manage.
    # TODO could be parallelized
    for app, windows in apps.items():
        if app in before_load_apps:
            logger.warning('`%s` was running prior to loading layout.', app)
            continue
            # TODO add param to load w/o running, run anyways, or stop
        else:
            # Start application, if not already started. Important these don't get interuptted!
            # TODO replace the workspace ids with those known not in to be loaded or before loaded!
            subprocess.run(['hyprctl', f'dispatch workspace {loading_id}'])
            subprocess.run(['hyprctl', f'dispatch renameworkspace {loading_id} Loading {app}...'])
            ack = subprocess.run(f'hyprctl dispatch exec "[workspace name:Loading {app}... silent;]" {app}', shell=True)

        # Sleep to wait to load. TODO replace with better listener.
        subprocess.run(['sleep', '3'])

        # Get new window data # TODO would be nice to target just tmp workspace
        loaded_apps  = get_app_to_windows(
            json.loads(
                subprocess.run(
                    ['hyprctl', '-j', 'clients'],
                    capture_output=True,
                ).stdout
            )
        )

        # Matches determined by keys, e.g., window class and title.
        # Matches are moved to layout's workspace, position, size, etc.
        updated_workspaces = set() # To avoid re-updating
        for target, window in windows.items():
            # Get target data
            workspace_id = window['workspace']['id']
            workspace_name = window['workspace']['name']
            monitor = str(window['monitor'])

            if target not in loaded_apps[app]:
                # Unassigned windows sit in a tmp workspace for user to handle
                logger.info('target %s not in loaded_apps', target)

                subprocess.run(['hyprctl', f'dispatch renameworkspace {loading_id} Unassigned {app}'])

                loading_id += 1
                continue

            # Get source data
            address = loaded_apps[app][target]['address']

            subprocess.run(f'hyprctl dispatch movetoworkspacesilent {workspace_id},address:{address}', shell=True)

            if workspace_id not in updated_workspaces:
                updated_workspaces.add(workspace_id)
                subprocess.run(['hyprctl', f'dispatch moveworkspacetomonitor {workspace_id} {monitor}'])
                subprocess.run(['hyprctl', f'dispatch renameworkspace {workspace_id} {workspace_name}'])

        # TODO, now that all the windows are in the workspace, they need
        # manipulated to match the desired layout..


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='load_hypr_layout.py')
    base_dir = '/home/prijatelj/.config/hypr'
    parser.add_argument(
        '-p',
        '--path',
        default=f'{base_dir}/layout_history'
    )
    parser.add_argument(
        '-a',
        '--apps',
        #nargs='*',
        #help='List of app names to be loaded (case insensitive)',
        help='Specific app name to be loaded (case insensitive)',
    )
    parser.add_argument(
        '--log',
        help='Log file or directory to write any logging to.',
        default=f'{base_dir}/load_layout_logs/'
    )
    # TODO Log level


    # TODO workspace arg to force a given layout on a specific workspace.

    args = parser.parse_args()

    #if os.path.isdir(args.load_layout_logs):
    #    args.load_layout_logs = f'{args.load_layout_logs}/test.log'

    #load_layout(args.filepath, set(args.apps))
    load_layout(f'{args.path}/2025-03-01_17-24-09-179432833.json', 'firefox')
