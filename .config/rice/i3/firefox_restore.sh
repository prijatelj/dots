# Opens Firefox, and if there is a prior firefox format, which needs saved
# after firefox closes or before the system shutsdown/logouts or the xorg
# session ends, then loads th

# TODO Load prior workspace setup, use dummy terminal sessions as placeholders
#   TODO NOTE this should be generalized and a part of another script that is
#   not firefox specific. We want to be able to reload the prior workspace
#   setup in genral.

# TODO Open firefox in one workspace

# TODO If there is a prior firefox workspace setup and firefox reopened the
# windows that corresponded to that prior setup, then moves those firefox
# windows to their correct workspace and orientation within that workspace.

# TODO upon termination of firefox, either by quitting, logging out, shutting
# down, power loss, or otherwise ending the current xorg session when firefox
# is open, save the current i3wm workspace setup and firefox window identifiers
# such that it may be recovered.
#   TODO Include a script or daemon that runs unprivileged for the user-session
#   and updates the current workspace setup, either by a timer e.g. every hour,
#   or if a change has occurred, or manually via a command run by the user.
