#!/usr/bin/perl

use IPC::Shareable;

my $glue = sprintf 'urxvt-last-dir-%d', $<;
my %options = (
    create    => 'yes',
    exclusive => 0,
    mode      => 0700,
    destroy   => 'no',
);

sub on_focus_in {
    my ($self) = @_;
    my $pid;
    tie $pid, 'IPC::Shareable', $glue, { %options };
    $pid = $self->{shell_pid};
}

sub on_child_start {
    my($self, $pid) = @_;
    $self->{shell_pid} = $pid;
}
