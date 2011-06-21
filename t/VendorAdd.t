#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::VendorAdd;

my $VendorAdd = XML::Quickbooks::Generator::VendorAdd->new;

$VendorAdd->as_xml("Test " . datetimestamp);

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($VendorAdd->request);

$VendorAdd->response($response);

ok ($VendorAdd->responseok, 'Check response');

# ---------------------------

my %v = (VendorTypeRef => {ListID => 'listid' . datetimestamp,
			  FullName => 'fullname' . datetimestamp});

$VendorAdd->warnxml(1);
$VendorAdd->as_xml("Test " . datetimestamp, \%v);

done_testing();
