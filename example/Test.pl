#!/usr/bin/perl

use Data::Dumper;

use FindBin qw($Bin);
use lib "$Bin/../lib";

use Mountebank::Imposter;
use Mountebank::Stub;
use Mountebank::Predicate::Equals;
use Mountebank::Response::Is;


my $stub = Mountebank::Stub->new();
$stub->predicate(
    Mountebank::Predicate::Equals->new("/api/auth", "POST")
)->response(
    Mountebank::Response::Is->new(200, {data => {"strData"}})
);

my $imposter = Mountebank::Imposter->new(9090, "http");

$imposter->stub($stub);

print Dumper($imposter->as_hash());
