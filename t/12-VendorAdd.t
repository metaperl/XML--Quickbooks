#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Writer::VendorAdd;

my $tmpnam = "Test " . timestamp;
my $data =  {Name => $tmpnam};
my $VendorAdd = XML::Quickbooks::Writer::VendorAdd->new(data => $data, maxwarn());

#die Data::Dumper::Dumper($VendorAdd);

$VendorAdd->process;

ok ($VendorAdd->responseok, 'Check response');

done_testing();
