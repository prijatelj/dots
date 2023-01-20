#!/bin/sh
# Opens Firefox, and if there is a prior firefox format, which needs saved
# after firefox closes or before the system shutsdown/logouts or the xorg
# session ends, then loads th

# TODO args management, if any
FIREFOX_LAYOUT_DIR="$HOME/.config/custom/i3/firefox_layouts/"

# TODO Load prior workspace setup, use dummy terminal sessions as placeholders
#   TODO NOTE this should be generalized and a part of another script that is
#   not firefox specific. We want to be able to reload the prior workspace
#   setup in genral.

## TODO make sure you do a check of FOSS code for this, it may already exist...
## it should, tbh
## e.g. https://github.com/klaxalk/i3-layout-manager
## Need to test this and see if it is all I need.

# TODO if workspace name already exists, then prepend it with "ff-restore-$ID"

# Get all active monitors and create tmp workspaces on each. Then populate.
for monitor in $(i3-msg -t get_workspaces | jq -c 'unique_by(.output) | .[]')
do
    # Get an array of output id and workspace name id from the monitor json
    output_name=($(printf "%s\n" $monitor \
        | jq -r '[.output, .name]' | tr -d '[]," '))

    # If monitor.output has firefox layouts, then populate, ow. continue
    monitor_ws=($(ls "$FIREFOX_LAYOUT_DIR/layout_out-${output_name[0]}"_ws-*.json))
    [[ -z $monitor_ws ]] && continue

    # Move to the workspace on the desired monitor
    i3-msg "workspace ${output_name[1]}"

    for filename in ${monitor_ws[@]}; do
        [ -e "$filename" ] || continue
        # Restore the layout in the correct workspace on the correct monitor.
        # Get workspace id from filename.
        WORKSPACE_ID=$(printf "%s\n" $filename | sed -e "s/^.*_ws-//" -e "s/\.json//")

        # For each Firefox window to be in the workspace, move them into layout
        i3-msg "workspace $WORKSPACE_ID; append_layout $filename"
    done
done

# Open firefox in one tmp workspace that restores the last session
i3-msg "workspace tmp_firefox; exec firefox; workspace $WORKSPACE_ID"

# TODO Account for visual error by restarting i3 inplace
#sleep 10 # Takes a bit to load firefox and move them appropriately
#i3-msg 'restart'
# NOTE for now, i leave this to user because it can cause some weird failures
# such as logging me out of my session!
# TODO consider setting up a restart after firefox's spike in CPU use ends.

# TODO If there is a prior firefox workspace setup and firefox reopened the
# windows that corresponded to that prior setup, then moves those firefox
# windows to their correct workspace and orientation within that workspace.
#   TODO orientation of windows in a workspace
#   TODO size of windows in a workspace

# TODO upon termination of firefox, either by quitting, logging out, shutting
# down, power loss, or otherwise ending the current xorg session when firefox
# is open, save the current i3wm workspace setup and firefox window identifiers
# such that it may be recovered.
#   TODO Include a script or daemon that runs unprivileged for the user-session
#   and updates the current workspace setup, either by a timer e.g. every hour,
#   or if a change has occurred in workspace, or manually via a command run by
#   the user.
