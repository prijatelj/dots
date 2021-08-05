#! /usr/bin/bash
# Saves current Firefox Browser layout: windows to workspaces and workspaces to
# monitors

# TODO infinite loop that sleeps until a change occurs in layout tht persists
# for some set time.
# TODO Detect Layout change
# TODO If layout change persists for longer than the given amount time, update
# saved layouts

# Loop through the workspaces, saving their layouts if they contain firefox.
for workspace in $(echo $(i3-msg -t get_workspaces) | jq -c '.[]'); do
    output_name=($(echo $workspace | jq -r '[.output, .name]' | tr -d '[]," '))

    # Get layout json, rm unnecessary comments, uncomment rest, rm unneeded keys
    i3-save-tree --workspace ${output_name[1]} | tail -n +2 | head -n -1 \
        | fgrep -v -e '// split' -e '// workspace' | sed 's|// ||g' \
        | jq \
        > "$FIREFOX_LAYOUT_PREFIX"_md-"${output_name[0]}"_ws-"${output_name[1]}".json

    # TODO Use jq to rm any comment not followed by "class": OR "title":
    # TODO remove any type="con" whose "swallows": [{"class":} is not "firefox$"
done
