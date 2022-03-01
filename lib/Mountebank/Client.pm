package Mountebank::Client;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $host = shift;
    my $port = shift;

    return bless {
        host => $host,
        port => $port,
        imposters => []
    }, $class
}

1;