package Mountebank::Imposter;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $port = shift;
    my $protocol = shift;

    return bless {
        port => $port,
        protocol => $protocol,
        stubs => []
    }, $class

}

sub stub {
    my $self = shift;
    my $stub = shift;

    push @{$self->{stubs}}, $stub;
    return $self;
}

sub as_hash() {
    my $self = shift;

    my @stubs = @{$self->{stubs}};

    return {
        port => $self->{port},
        protocol => $self->{protocol},
        stubs => [
            map {$_->as_hash()} @stubs
        ]
    }
}

1;