#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::CustomerAdd;

my $CustomerAdd = XML::Quickbooks::Generator::CustomerAdd->new;

my $tmpnam = "Test " . datetimestamp();

$CustomerAdd->as_xml({name => $tmpnam});

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($CustomerAdd->request);

$CustomerAdd->response($response);

ok ($CustomerAdd->responseok, 'Check response');

done_testing();
