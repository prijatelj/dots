#!/bin/bash
# If the focused window is a terminal, creates a new terminal at the current
# working directory.

# NOTE this implementation is dependent upon urxvt and bash

# Obtain the PID of the focused window
WIN_PID=$(xdotool getwindowpid $(xdotool getwindowfocus))

# Obtain the tree of processes for the focused window's PID
PSTREE=$(pstree -p $WIN_PID)

# Check if the focused window contains urxvt running bash
if [[ $PSTREE =~ "urxvt($WIN_PID)---bash(" ]]; then
    BASH_PID=$(echo $PSTREE | grep -oE "urxvt\($WIN_PID\)---bash\([0-9]*" | grep -oE "bash\(.*")
    BASH_PID=${BASH_PID:5}

    if [ -e "/proc/$BASH_PID/cwd" ]; then
        echo "copied cwd"
        urxvt -cd $(readlink "/proc/$BASH_PID/cwd") &
    else
        echo "Error: cwd does not exist. PID = $BASH_PID"
        echo "Error: WIN_PID = $WIN_PID"
        urxvt &
    fi
else
    echo "Error: Focused window was not a terminal."
    echo $PSTREE
    urxvt &
fi

