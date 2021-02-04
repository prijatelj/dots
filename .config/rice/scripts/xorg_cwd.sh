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
    # TODO consider ability to get PID of the bash session in vim.
    BASH_PID=$(echo $PSTREE | grep -oE "urxvt\($WIN_PID\)---bash\([0-9]*" | grep -oE "bash\(.*")
    BASH_PID=${BASH_PID:5}

    if [ -e "/proc/$BASH_PID/cwd" ]; then
        echo "Successfully copied cwd."
        urxvt -cd $(readlink "/proc/$BASH_PID/cwd") &
    else
        echo "Error: cwd does not exist. WIN_PID = $WINPID. BASH PID = $BASH_PID"
        urxvt &
    fi
else
    echo "Error: Focused window was not a terminal. WIN_PID = $WINPID."
    urxvt &
fi

