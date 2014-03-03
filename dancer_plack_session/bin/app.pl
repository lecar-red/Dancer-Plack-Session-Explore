#!/usr/bin/env perl

use lib qw( lib );
use Dancer;
use Plack::Builder;

# original
use PlackSession;

#dance;

builder {
    enable "Session", store => "File";
    sub { my $env = shift; my $request = Dancer::Request->new(env => $env); Dancer->dance($request); };
};
