#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Writer::CustomerAdd;

my $tmpnam = "Test " . timestamp;
my $data =  {Name => $tmpnam};
my $CustomerAdd = XML::Quickbooks::Writer::CustomerAdd->new(data => $data, maxwarn());


$CustomerAdd->as_xml();

warn $CustomerAdd->request;

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($CustomerAdd->request);
warn $response;

$CustomerAdd->response($response);

ok ($CustomerAdd->responseok, 'Check response');

done_testing();
