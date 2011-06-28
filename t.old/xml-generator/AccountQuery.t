#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::AccountQuery;

my $Operation = XML::Quickbooks::Generator::AccountQuery->new(warnxml => 1);
my %arg = (
  FullName => 'Test CostOfGoodsSold13-12-17'
);

ok ($Operation->exists(\%arg), 'Check response');

warn $Operation->responsetree->as_XML();

done_testing();
