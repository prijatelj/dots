# Opens Firefox, and if there is a prior firefox format, which needs saved
# after firefox closes or before the system shutsdown/logouts or the xorg
# session ends, then loads th

# TODO args management, if any
FIREFOX_LAYOUT_PREFIX="$HOME/.config/rice/i3/firefox_layouts/workspace"

# TODO Load prior workspace setup, use dummy terminal sessions as placeholders
#   TODO NOTE this should be generalized and a part of another script that is
#   not firefox specific. We want to be able to reload the prior workspace
#   setup in genral.

## TODO make sure you do a check of FOSS code for this, it may already exist...
## it should, tbh
## e.g. https://github.com/klaxalk/i3-layout-manager
## Need to test this and see if it is all I need.



# If custom swallow keys work, then this loop may be called prior to firefox
# Restore all prior workspaces
for filename in "$FIREFOX_LAYOUT_PREFIX"*.json; do
    [ -e "$filename" ] || continue
    # Restore the layout in the correct workspace on the correct monitor.
    # Get workspace id and monitor from filename.
    MONITOR_ID=$(echo $filename | sed -e "s/^.*_md-//" -e "s/\.json//")
    WORKSPACE_ID=$(echo $MONITOR_ID | sed -e "s/^.*_ws-//")
    MONITOR_ID=$(echo $MONITOR_ID | sed -e "s/_ws-.*//")

    # For each Firefox window to be in the workspace, move them into layout
    i3-msg "workspace $WORKSPACE_ID; append_layout $filename"
    # TODO put the workspace on the correct monitor!
done

# Open firefox in one tmp workspace that restores the last session
i3-msg 'workspace tmp_firefox; exec /usr/bin/firefox'

# Account for visual error by restarting i3 inplace
sleep 3 # Takes a bit to load firefox and move them appropriately
i3-msg 'restart'

# TODO If there is a prior firefox workspace setup and firefox reopened the
# windows that corresponded to that prior setup, then moves those firefox
# windows to their correct workspace and orientation within that workspace.
#   TODO orientation of windows in a workspace
#   TODO size of windows in a workspace

# TODO load from some file the workspace setup

# TODO for each open firefox window, match its id to the id in workspace setup
#  TODO Move that window to its proper place, starting with top level of that
#  workspace. Code module for one workspace at a time, optionally parallelize.

# TODO Once that level of the workspace is occupied with the correct firefox
# windows, resize them as appropriate.

# TODO If there is more children in i3wm window tree, continue from top-down



# TODO upon termination of firefox, either by quitting, logging out, shutting
# down, power loss, or otherwise ending the current xorg session when firefox
# is open, save the current i3wm workspace setup and firefox window identifiers
# such that it may be recovered.
#   TODO Include a script or daemon that runs unprivileged for the user-session
#   and updates the current workspace setup, either by a timer e.g. every hour,
#   or if a change has occurred in workspace, or manually via a command run by
#   the user.
