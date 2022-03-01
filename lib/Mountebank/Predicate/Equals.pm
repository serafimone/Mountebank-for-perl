package Mountebank::Predicate::Equals;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $path = shift;
    my $method = shift;
    my $body = shift;
    my $requestFrom = shift;
    my $query = shift;

    return bless {
        path => $path,
        method => $method,
        body => $body,
        requestFrom => $requestFrom,
        query => $query,
    }, $class
}

sub as_hash {
    my $self = shift;

    my $hash = {};
    for (qw / method path query body requestFrom /) {
        $hash->{$_} = $self->{$_} if $self->{$_}
    }
    return {
        equals => $hash
    }
}

1;