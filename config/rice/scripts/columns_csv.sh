# TODO Make script that takes a filepath and optional -s that defaults to ','
# add alias csv to this script to bashrc or zshrc
column -ts, < vtune/8kb.tsv | less -#2 -N -S

# how to do w/ tabs:
column -ts $'\t' < vtune/8kb.tsv | less -#2 -N -S
