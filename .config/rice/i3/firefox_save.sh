#! /usr/bin/bash
# Saves current Firefox Browser layout: windows to workspaces and workspaces to
# monitors

# TODO infinite loop that sleeps until a change occurs in layout tht persists
# for some set time.
# TODO Detect Layout change
# TODO If layout change persists for longer than the given amount time, update
# saved layouts

# TODO get all workspaces open

# Per workspace:

# Save the i3 layout tree
i3-save-tree --workspace $WORKSPACE_ID > \
    "$FIREFOX_LAYOUT_PREFIX"_md-"$MONITOR_ID"_ws-"$WORKSPACE_ID".json

# TODO Uncomment class and title
# TODO Add monitor_id, workspace_id, and window_id into swallows
