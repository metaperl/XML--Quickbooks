#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator;

my $Operation = XML::Quickbooks::Generator::ItemInventoryQuery->new(warnrequest => 1, warnresponse => 1);
my %arg = (
  FullName => 'Maui'
);

ok ($Operation->exists(\%arg), 'Check response');

done_testing();
