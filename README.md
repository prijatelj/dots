# Dot Files
Arch linux dot files for custom configuration and ricing.

## TODO
- Get zsh
    - replace all bash things with zsh things while ensuring able to use bash.
    - zsh meant for interacting in terminal.
    - setup tab completions, tab/up arrow history recall (similar to ipython), longer history.
- setup scripts for proper ssh security and optinal remote login
- scripts / ntes for Vim setup
    + Vundle
    + ALE
        - pylint and with custom pylint style.
        - vim spell check disabled by default,
    + fzf
    + vim yapf command on current file
        - vim spelling / grammar / etc correction.
    + vim git commit command for quick commits of file only changes
        - (or get fluent with cli through vim, though a command may be quicker)
        - useful for saving more fine grained commits/ diffs
- i3
    + set login default volume
    + i3 volume controls
        - volume scroll wheel on keyboard if exists
        - pause / lay key on keyboard if exists
        - mute key on keyboard if exists
        - i3 bar / dmenu for assigning float value to set volume percent.
    + custom i3lock colors (and identifiaction of current signed in user)
    + vim-like markers possibly automated to ease jumping between containers within a window/screen.
        - when having 3+ containers on one screen it' dbe nicer for a single hotkey combo rather than a chain of them to get to the desired container.
    + i3 bar:
        - indicator of current volume / audio output visualizer in db and freqs
        - internet up and down speeds / usage and connected / used
        - clickable to expand for more info (perhaps open tmp floating windows)
            - for volume/audio visual
            - network usage
            - calandar by clicking datetime
    + Save existing screen and container layout (and other layout/templates) for loading when logging back in.
        - and for ease of creating via a command or i3bar/dmenu type loading menu
        - setup neofetch rice layout
- firefox
    + recolorize and add transparency to scroll bar
        - hide unless scrolling or somehow quering the scroll bar (to see page size)
        - dark theme the scroll bar (may have to be GTK theme or something)
        - thin the scroll bar down a bit.
    + Stylus
        - save all git locations for CSS templates of websites
        - save custom modificaiton to such designs via forks of originals.
        - perhaps save profile, or somehing akin to this, if able to save customization not typically saved via firefox account.
