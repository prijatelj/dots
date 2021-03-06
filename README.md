## Dots

Arch linux dot files for custom configuration and ricing.

### Install

To install, simply use:

```git clone <repo> ~```

Be sure there are no existing files that overlap with those in the repo, otherwise ensure you have backups of the files before cloning.

### TODO

- Get zsh
    - replace all bash things with zsh things while ensuring able to use bash.
    - zsh meant for interacting in terminal.
    - setup tab completions, tab/up arrow history recall (similar to ipython),
      longer history.
    - figure out the other nice+ities of zsh.
    - wc alias / scripts
        - add aliased script for getting line count of code files but ignoring:
        whitespace, empty lines, and all comments at least. (perhaps this exists)
- security
    - setup scripts for proper ssh security and optinal remote login
        - done but not added to repo?
- Vim: scripts / notes for Vim setup
    - Vundle
    - ALE
        - yapf and pylint and with custom pylint style.
            - ie. ignore pylint style warnings, let yapf handle it.
            - command to apply yapf to current file, possibly do so upon each
              save.
            - isort, if not done by yapf, to sort and organize the imports atop
              the file.
        - vim spell check disabled by default,
    - fzf
    - vim yapf command on current file
        - yapf selection of code (possibly ALE-ing a portion of code then).
    - vim support for LaTeX and writing.
        - vim spelling / grammar / etc correction.
        - turn off/on clean identing paragraph wrapping?
            - maybe not, cuz ideally write in LaTeX and line length is useful
              to know (identify longer lines)
            - but perhaps good for .txt files? idk atm could just write in .md
              files always.
    - vim git commit command for quick commits of file only changes
        - (or get fluent with cli through vim, though a command may be quicker)
        - useful for saving more fine grained commits/ diffs
    - vim autocompletion?
    - alias or learn how to select a word or string in a file, and then replace
      all occurrence of that string in the file with a new string.  So
      basically, a means to take whatever is selected in selection mode and do
      `%s/string_selected/whatever_replaces_it/g`
    - Need vim commands that do what yapf does not for python styling:
        - alphabetize imports, and split into sections:
            python defaults, 3rd party, this package.
        - easy correction of long lines starting w/ [, (, or { such that every
            entry is on its own line, indented once more than original line and
            the closing bracket is dedented.
    - learn how to use vim as a terminal, and be able to use vim key bindings when working in the terminal
- i3
    - Smaller increment adjustment for resizing containers.
    - set login default volume
        - both alsa and pulseaudio versions.
    - i3 volume controls
        - volume scroll wheel on keyboard if exists
        - pause / lay key on keyboard if exists
        - mute key on keyboard if exists
        - i3 bar / dmenu for assigning float value to set volume percent.
        - i3 bar status of output volume and microphone [un]mute icon
        - amixer command for toggle muting the microphone
    - custom i3lock colors (and identifiaction of current signed in user)
    - vim-like markers possibly automated to ease jumping between containers
      within a window/screen.
        - when having 3+ containers on one screen it'd be nicer for a single
          or 2 hotkey combo rather than a chain of them to get to the desired
          container.
        - The above here is about hotkeys within a workspace. Convenience
          hotkeys for each screen may be of interest. Each screen has a hotkey
          and the hotkey goes to that screen's active work space and active
          container w/in that workspace.
    - i3 bar:
        - indicator of current volume / audio output visualizer in db and freqs
        - internet up and down speeds / usage and connected / used
        - clickable to expand for more info (perhaps open tmp floating windows)
            - for volume/audio visual
            - network usage
            - calandar by clicking datetime
        - Optionally hide/make visible via key command toggle.
    - Save existing screen and container layout (and other layout/templates)
      for loading when logging back in.
        - and for ease of creating via a command or i3bar/dmenu type loading
          menu
        - setup neofetch rice layout
    - Customizable contianer boarders and headers
        - font of i3 and font size.
        - Optionally hide/make visible via key command toggle.
        - online adjustment of gaps
    - In addition to creating new terminal at cwd, add hotkey to create a new terminal at cwd w/ the same environment, var envs, anaconda setup? maybe?
- firefox
    - recolorize and add transparency to scroll bar
        - hide unless scrolling or somehow quering the scroll bar (to see page
          size)
        - dark theme the scroll bar (may have to be GTK theme or something)
        - thin the scroll bar down a bit.
    - Stylus
        - save all git locations for CSS templates of websites
        - save custom modificaiton to such designs via forks of originals.
        - perhaps save profile, or somehing akin to this, if able to save
          customization not typically saved via firefox account.
- urxvt
    - Dynamically change the font size with hotkeys akin to Ctrl+=/Ctrl+- (zoom
      in / out respectively).
        - This is necessary for testing different font sizes and seeing what I
          like on what screen
        - Also for when others need to read something in my terminal, esp. from
          a distance.
    - Find or create a font that is not a XFT as XFT fonts are slow.
- tmux
    - Consider using tmux within a single screen as the means of mutliple
      terminals
        - Must change the default key to something non-invasive (perhaps alt
          key by itself?) and it must be a single key and easy to move around
          as it is in i3.
        - Make the movements between adjacent panes the same as i3
        - ease jumping to panes, if doable (a single hotkey is preferred).
        - if unable to make a single key that must always be pressed, then make
          it modal like vim and use one key to toggle it.
- Mouse Interface
    - make the buttons on the mouse complete various hotkeys
        - i3 navigation hotkeys?
        - optionally open a virtual keyboard?
        - hotkey to open common progs?
        - and have to make it so that these hotkey mappings can be swapped ie.
          if using Blender.
    - Reset the "hot fire" key to _NOT_ be back page in webbrowser (make this a
      different key).
- General Keyboard config:
    - Swap caps lock for some other key that is actually useful near the home
      row (ie. ctrl), or at least make it a free key to assign hotkeys to.
