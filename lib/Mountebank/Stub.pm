package Mountebank::Stub;

use strict;
use warnings;

sub new {
    my $class = shift;

    return bless {
        predicates => [],
        responses => []
    }, $class
}

sub predicate {
    my $self = shift;
    my $predicate = shift;

    push @{$self->{predicates}}, $predicate;
    return $self;
}

sub response {
    my $self = shift;
    my $response = shift;
    
    push @{$self->{responses}}, $response;
    return $self;
}

sub as_hash {
    my $self = shift;

    my @predicates = @{$self->{predicates}};
    my @responses = @{$self->{responses}};

    return {
        predicates => [map {$_->as_hash} @predicates],
        responses => [map {$_->as_hash} @responses]
    };
}

1;
