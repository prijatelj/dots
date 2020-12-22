##Local Scripts
Sometimes, you may want to install a binary or executable as a user only, such as rclone.
To do, you need to store the executable in ".local/bin" and ensure ".local/bin" is in your path.
To provide it with a man page, add its man page to ".local/share/man/man1/" and ensure that path is added to the end of your "MANPATH" variable (ie. via bashrc).
