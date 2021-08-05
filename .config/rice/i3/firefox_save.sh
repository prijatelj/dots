#!/usr/bin/bash
# Saves current Firefox Browser layout: windows to workspaces and workspaces to
# monitors

# TODO infinite loop that sleeps until a change occurs in layout tht persists
# for some set time.
# TODO Detect Layout change
# TODO If layout change persists for longer than the given amount time, update
# saved layouts

# Loop through the workspaces, saving their layouts if they contain firefox.
for workspace in $(i3-msg -t get_workspaces | jq -c '.[]'); do
    # Get Array of Output and Name ids.
    output_name=($(echo $workspace | jq -r '[.output, .name]' | tr -d '[]," '))

    # If no firefox window in this workspace, continue
    [[ ! $(echo $WS_TREE | fgrep -m 1 -q '^firefox$') ]] && continue

    # Get layout json, rm unnecessary comments, uncomment rest, rm unwanted keys
    i3-save-tree --workspace ${output_name[1]} \
        | tail -n +2 | head -n -1 \
        | fgrep -v -e '// split' -e '// workspace' | sed 's|// ||g' \
        | jq -s 'map(.swallows[0] |= {class, title})' \
        | "$FIREFOX_LAYOUT_DIR/layout"_md-"${output_name[0]}"_ws-"${output_name[1]}".json
done

# rm non-firefox windows: left out due to wanting to preserve original
# layout even if placeholders remain.
#echo $WS_TREE | jq -s 'map(select(.swallows[0].class == "^firefox$")) \

# rm unwanted keys by whitelisting class and title. Then save
