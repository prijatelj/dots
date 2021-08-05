#!/bin/bash

if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
    echo "Error: Expected a single argument to be passed on call."
    exit 1;
fi

LAYOUT_NAME=$1

# if the directory for the layout does not exist, create it
if [ ! -d "~/.config/i3/layouts/$LAYOUT_NAME"]
    # TODO check if a file instead as it may pass this test?
    mkdir "~/.config/i3/layouts/$LAYOUT_NAME"
    #TODO ensure mkdir worked
fi

# TODO  Saves the current existing layout with the given name.
i3-save-tree --workspace N > ~/.config/i3/layouts/$LAYOUT_NAME/workspace_N.json

tail -n +2 ~/.config/i3/layouts/$LAYOUT_NAME/workspace_N.json \
    | fgrep -v '// splitv' \
    | sed 's|//||g' > ~/.config/i3/laylouts/$LAYOUT_NAME/workspace_N.json
