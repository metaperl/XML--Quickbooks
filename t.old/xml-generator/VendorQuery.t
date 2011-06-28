#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::VendorQuery;

my $Operation = XML::Quickbooks::Generator::VendorQuery->new(warnxml => 1);
my %arg = (
  FullName => 'State Tax'
);

$Operation->submit(\%arg);

ok ($Operation->exists(\%arg), 'Check response');

warn $Operation->responsetree->as_XML();

$arg{FullName} = 'something you wont find ... rumplestiltskin';

is($Operation->exists(\%arg), '', 'query should not find anything');
warn $Operation->responsetree->as_XML();

like ($Operation->responsemsg, qr/could not be found/, 'Indicate Vendor not found');


done_testing();
