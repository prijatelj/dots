#!/bin/sh
# Saves current workspace and windows layout for loading to resume last session.
mkdir -p $HYPRLAND_LAYOUT_DIR

# Save `hyprctl clients`
hyprctl -j clients > $HYPRLAND_LAYOUT_DIR/$(date +%Y-%m-%d_%H-%M-%S-%N).json

# Clean up old layouts with a move to layouts/old/date, and clean layouts/old/ by set duration to keep
RM_LIST=$(for i in $(ls --sort time $HYPRLAND_LAYOUT_DIR | tail -n +$HYPRLAND_LAYOUT_HISTORY_SIZE); do echo "$HYPRLAND_LAYOUT_DIR/$i";  done)

if [ -n "$RM_LIST" ]; then
	rm $RM_LIST
fi
