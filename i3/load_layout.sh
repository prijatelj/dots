#!/bin/bash

# TODO, archl wiki only has it for loading workspaces, not for loading multiple workspaces.
# plus need to make this take an argument for the set of workspaces to load.
# I should make separate scirpts, the save/load_workspace and save/load_layout, where workspace is just for a single workspace and layout is for the entire X session. (perhaps save/load session, then?)

# M  is the number of the worksapce in which to laod the following workspace.
i3-msg "workspace M; append_layout ~/.i3/workspace_N.json"


