#! /usr/bin/bash
# Saves current Firefox Browser layout: windows to workspaces and workspaces to
# monitors

# TODO infinite loop that sleeps until a change occurs in layout tht persists
# for some set time.
# TODO Detect Layout change
# TODO If layout change persists for longer than the given amount time, update
# saved layouts

# Get all monitor outputs as bash array, diregarding the first which is x-root
MONITORS=($(i3-msg -t get_outputs | jq -r '.[1:] | map(.name)' | tr -d '[]," '))

# TODO get the workspaces per monitor
WORKSPACES=$(i3-msg -t get_workspaces)

MONITORS=($(echo $WORKSPACES | jq -r '[to_entries[] | .value.output] | unique' | tr -d '[]," '))

# TODO use the tree to find the workspaces' outputs

# Get the json of Outputs and their respective workspaces
for OUTPUT in "${MONITORS[@]}"; do
    # TODO Loop through each workspace per monitor

    # Obtain the json of that output, rm unnecessary comments, uncomment remainder
    for WORKSPACE in "${WORKSPACES[@]}"; do
        i3-save-tree --workspace $WORKSPACE | tail -n +2 | head -n -1 \
            | fgrep -v -e '// split' -e '// workspace' | sed 's|// ||g' \
            | jq \ # rm undesirable keys in swallows
            > "$FIREFOX_LAYOUT_PREFIX"_md-"$OUTPUT"_ws-"$WORKSPACE".json
    done

    # TODO Use jq to rm any comment not followed by "class": OR "title":
    # TODO remove any type="con" whose "swallows": [{"class":} is not "firefox$"

    # TODO split output jsons into workspace jsons
done

# Per workspace:

# Save the i3 layout tree
i3-save-tree --workspace $WORKSPACE_ID > \
    "$FIREFOX_LAYOUT_PREFIX"_md-"$MONITOR_ID"_ws-"$WORKSPACE_ID".json
