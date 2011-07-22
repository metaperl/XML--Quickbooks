#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Tolol::CustomerAdd;

my $tmpnam = "Test " . datetimestamp();
my $data = {Name => $tmpnam};
my $CustomerAdd = XML::Quickbooks::Tolol::CustomerAdd->new(data => $data);


$CustomerAdd->as_xml();

warn $CustomerAdd->request;

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($CustomerAdd->request);
warn $response;

$CustomerAdd->response($response);

ok ($CustomerAdd->responseok, 'Check response');

done_testing();
