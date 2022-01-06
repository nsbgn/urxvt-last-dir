#!/usr/bin/perl

use IPC::Shareable;

my $glue = sprintf 'urxvt-last-dir-%d', $<;
my %options = (
    create    => 'yes',
    exclusive => 0,
    mode      => 0700,
    destroy   => 'no',
);

sub on_init {
    my ($self) = @_;
    my $pid;
    tie $pid, 'IPC::Shareable', $glue, { %options };

    if (defined $pid and $pid ne "") {

        # Using shell process since `tcgetpgrp` does not work (see
        # github.com/rmedaer/rmedaer.github.io/issues/5)
        my $tpgid = qx/ps p $pid -o tpgid=/;
        if ($tpgid eq "" or $tpgid < 1) {
            $tpgid = $pid;
        }

        my $link = sprintf "/proc/%d/cwd", $tpgid;
        my $wd = readlink $link;
        if (-e $wd) {
            $self->resource("chdir", $wd);
        }
    }
}
