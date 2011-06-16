#!/usr/bin/perl

use Test::More;

use XML::Quickbooks::Generator::VendorAdd;

my $VendorAdd = XML::Quickbooks::Generator::VendorAdd->new;

use UUID::Tiny;
my $tmpnam = substr("Test " . create_UUID_as_string(UUID_V1), 0 , 40);

$VendorAdd->as_xml($tmpnam);

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($VendorAdd->request);

$VendorAdd->response($response);

ok ($VendorAdd->responseok, 'Check response');

done_testing();
