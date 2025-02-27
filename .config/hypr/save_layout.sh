#!/bin/sh

# Saves current workspace and windows layout for loading to resume last session.

HYPRLAND_LAYOUT_DIR="$HOME/.config/hypr/layout_history"
N_KEPT_PAST_LAYOUTS=5

mkdir -p $HYPRLAND_LAYOUT_DIR

# Save `hyprctl clients`
#hyprctl clients | sed 's/\t/  /g' > $HYPRLAND_LAYOUT_DIR/$(date +%Y-%m-%d_%H-%M-%S-%N).yaml
hyprctl -j clients > $HYPRLAND_LAYOUT_DIR/$(date +%Y-%m-%d_%H-%M-%S-%N).json

# Clean up old layouts with a move to layouts/old/date, and clean layouts/old/ by set duration to keep
RM_LIST=$(for i in $(ls --sort time $HYPRLAND_LAYOUT_DIR | tail -n +$N_KEPT_PAST_LAYOUTS); do echo "$HYPRLAND_LAYOUT_DIR/$i";  done)

if [ -n "$RM_LIST" ]; then
	rm $RM_LIST
fi


# Simplify top level keys to just their ids

# TODO Add the following top level keys:
# apps-to-ids : app_class -> [ids]
# workspaces-to-ids: workspace -> [ids]

# This could be as simple as parse the output into a JSON schema, then simply load that schema and put placeholder listeners (like i3 did) such that once the windows are recreated they are moved automatically to their spot.
