package Mountebank::Response::Is;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $statusCode = shift;
    my $body = shift;

    return bless {
        statusCode => $statusCode,
        body => $body
    }, $class;
}

sub as_hash {
    my $self = shift;

    return {
        is => {
            statusCode => $self->{statusCode},
            body => $self->{body}
        }
    }
}

1;