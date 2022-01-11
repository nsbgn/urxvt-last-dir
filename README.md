# urxvt-cwd

Spawning a terminal in the same directory as the working directory of the 
current foreground process is quite useful. In `vim`, this is doubly so when 
combined with [vim-rooter](https://github.com/airblade/vim-rooter).

However, environments are subtly different: are we running under X or Wayland? 
Is the terminal emulator a single instance application? Is the process wrapped 
in `tmux`? Is the foreground process correctly identified? The scripts in this 
repository are intended for use with `urxvtd`+`urxvtc`. They take into account 
the foreground process but nothing else.

-   [urxvt-cwd.sh](urxvt-cwd.sh) is a tiny shell script that uses `ps`, `awk` 
    and `xdotool` to show the current directory of the *focused* terminal. 
    Invoke with `urxvtc -cd "$(urxvt-cwd.sh)"`.
-   [urxvtperl/](urxvtperl/) contains a Perl extension for `urxvt` that keeps 
    track of the *last open* directory instead.

See also:

- <https://github.com/schischi/xcwd>
- <https://github.com/wknapik/lastcwd>
- <https://gist.github.com/viking/5851049>

