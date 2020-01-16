# Dot Files Arch linux dot files for custom configuration and ricing.

## TODO
- Get zsh
    - replace all bash things with zsh things while ensuring able to use bash.
    - zsh meant for interacting in terminal.
    - setup tab completions, tab/up arrow history recall (similar to ipython),
      longer history.
- setup scripts for proper ssh security and optinal remote login
- scripts / ntes for Vim setup
    + Vundle
    + ALE
        - yapf and pylint and with custom pylint style.
            - ie. ignore pylint style warnings, let yapf handle it.
            - command to apply yapf to current file, possibly do so upon each
              save.
            - isort, if not done by yapf, to sort and organize the imports atop
              the file.
        - vim spell check disabled by default,
    + fzf
    + vim yapf command on current file
    + vim support for LaTeX and writing.
        - vim spelling / grammar / etc correction.
        - turn off/on clean identing paragraph wrapping?
            - maybe not, cuz ideally write in LaTeX and line length is useful
              to know (identify longer lines)
            - but perhaps good for .txt files? idk atm could just write in .md
              files always.
    + vim git commit command for quick commits of file only changes
        - (or get fluent with cli through vim, though a command may be quicker)
        - useful for saving more fine grained commits/ diffs
    + vim autocompletion?
- i3
    + Smaller increment adjustment of container sizes.
    + set login default volume
    + i3 volume controls
        - volume scroll wheel on keyboard if exists
        - pause / lay key on keyboard if exists
        - mute key on keyboard if exists
        - i3 bar / dmenu for assigning float value to set volume percent.
    + custom i3lock colors (and identifiaction of current signed in user)
    + vim-like markers possibly automated to ease jumping between containers
      within a window/screen.
        - when having 3+ containers on one screen it' dbe nicer for a single
          hotkey combo rather than a chain of them to get to the desired
          container.
    + i3 bar:
        - indicator of current volume / audio output visualizer in db and freqs
        - internet up and down speeds / usage and connected / used
        - clickable to expand for more info (perhaps open tmp floating windows)
            - for volume/audio visual
            - network usage
            - calandar by clicking datetime
        - Optionally hide/make visible via key command toggle.
    + Save existing screen and container layout (and other layout/templates)
      for loading when logging back in.
        - and for ease of creating via a command or i3bar/dmenu type loading
          menu
        - setup neofetch rice layout
- firefox
    + recolorize and add transparency to scroll bar
        - hide unless scrolling or somehow quering the scroll bar (to see page
          size)
        - dark theme the scroll bar (may have to be GTK theme or something)
        - thin the scroll bar down a bit.
    + Stylus
        - save all git locations for CSS templates of websites
        - save custom modificaiton to such designs via forks of originals.
        - perhaps save profile, or somehing akin to this, if able to save
          customization not typically saved via firefox account.
- urxvt
    + Dynamically change the font size with hotkeys akin to Ctrl+=/Ctrl+- (zoom
      in / out respectively).
        - This is necessary for testing different font sizes and seeing what I
          like on what screen
        - Also for when others need to read something in my terminal, esp. from
          a distance.
- tmux
    + Consider using tmux within a single screen as the means of mutliple
      terminals
        - Must change the default key to something non-invasive (perhaps alt
          key by itself?) and it must be a single key and easy to move around
          as it is in i3.
        - Make the movements between adjacent panes the same as i3
        - ease jumping to panes, if doable (a single hotkey is preferred).
- Mouse Interface
    + make the buttons on the mouse complete various hotkeys
        - i3 navigation hotkeys?
        - optionally open a virtual keyboard?
        - hotkey to open common progs?
        - and have to make it so that these hotkey mappings can be swapped ie.
          if using Blender.
    + Reset the "hot fire" key to _NOT_ be back page in webbrowser (make this a
      different key).
