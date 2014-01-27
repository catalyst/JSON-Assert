#!/usr/bin/perl

use strict;
use warnings;
use Test::More qw(no_plan);
use JSON::Assert;
use JSON;
use FindBin qw($Bin);
use lib "$Bin";

# $JSON::Assert::VERBOSE = 1;

require 'data.pl';

my $json = decode_json( json() );

my $tests_ok = [
   {
       jpath => q{$..catalog.cd[0].artist},
       match => q{Bob Dylan},
       name  => q{First artist is Bob Dylan},
   },
   {
       #jpath => q{$..cd[?(defined $_->{genre})][1].genre},
       jpath => q{$..cd[?($_->{genre}) eq 'Country')].genre},
       match => q{Country},
       name  => q{Second CD with a 'genre' attribute is a Country album},
   },
];

my $json_assert = JSON::Assert->new();

foreach my $t ( @$tests_ok ) {
    ok( $json_assert->does_jpath_value_match($json, $t->{jpath}, $t->{match}), $t->{name} )
	    or diag($json_assert->error);
}
