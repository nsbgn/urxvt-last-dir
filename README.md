# urxvt-last-dir

This is a Perl extension for `urxvt` that allows the user to open a new 
terminal window in the same directory as the previous one.

The original script is courtesy of Raphaël Medaer, as published at 
<https://raphael.medaer.me/2019/06/21/urxvt-open-current-wd.html>. It has been 
extended to use the current directory of the *foreground process*, rather than 
the current directory of the parent shell. This means the working directory 
inside TUI programs like `lf` or `vim` will be taken into account. The latter 
is particularly useful when combined with 
[vim-rooter](https://github.com/airblade/vim-rooter).

Programs like [xcwd](https://github.com/schischi/xcwd) perform a similar 
function, but explicitly cannot work for daemon-client applications like 
`urxvtc`+`urxvtd`. They also tend to disregard the foreground process.


### Installation

Copy or link the scripts to the `~/.urxvt/ext/` directory, then add the 
following line to your `~/.Xresources`:

    URxvt.perl-ext-common: remember-last-dir

Once you have restarted `urxvtd`, you can call `urxvtc -pe open-last-dir` to 
open the new process in the same working directory.
