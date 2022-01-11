# urxvt-cwd

Spawning a terminal in the same directory as the working directory of the 
current foreground process is quite useful. In `vim`, this is doubly so when 
combined with [vim-rooter](https://github.com/airblade/vim-rooter). However, 
environments are subtly different: are we running under X or Wayland? Is the 
terminal emulator a single instance application? Is the process wrapped in 
`tmux`? Is the foreground process correctly identified?

The scripts in this repository provide a solution for `urxvtd`+`urxvtc`.


### Shell

[urxvt-cwd.sh](urxvt-cwd.sh) is a tiny shell script that uses `ps`, `awk` and 
`xdotool` to show the current directory of the **foreground process** in the 
**focused terminal**. Invoke with `urxvtc -cd "$(urxvt-cwd.sh)"`.


### Perl extension

[remember-last-dir.pl](remember-last-dir.pl) and 
[open-last-dir.pl](open-last-dir.pl) are Perl extensions that track the **last 
open terminal** instead. The original script is courtesy of Raphaël Medaer, as 
published at <https://raphael.medaer.me/2019/06/21/urxvt-open-current-wd.html>. 
It has been extended to use the current directory of the **foreground 
process**, rather than the current directory of the parent shell. To use, copy 
or link the scripts to the `~/.urxvt/ext/` directory, then add the following 
line to your `~/.Xresources`:

    URxvt.perl-ext-common: remember-last-dir.pl

Once you have restarted `urxvtd`, invoke with `urxvtc -pe open-last-dir.pl`.
