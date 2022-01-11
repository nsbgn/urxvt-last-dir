# term-cwd

Spawning a terminal in the same directory as the working directory of the 
current foreground process is quite useful. In `vim`, this is doubly so when 
combined with [vim-rooter](https://github.com/airblade/vim-rooter).

However, environments are subtly different: are we running under X or Wayland? 
Is the terminal emulator a single instance application? Is the process wrapped 
in `tmux`? Is the foreground process correctly identified?

[urxvtperl/](urxvtperl/) contains a Perl extension for urxvt that keeps track 
of the last directory. It works for `urxvtc`+`urxvtd` and takes into account 
the foreground process.

Alternatively, you can use the [xcwd.sh](xcwd), which does the same in shell. I 
may add scripts for other environments later.

See also:

- <https://github.com/schischi/xcwd>
- <https://github.com/wknapik/lastcwd>
- <https://gist.github.com/viking/5851049>

