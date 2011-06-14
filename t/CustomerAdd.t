#!/usr/bin/perl

use XML::Quickbooks::CustomerAdd;

my $CustomerAdd = XML::Quickbooks::CustomerAdd->new;
$CustomerAdd->as_xml('Matt Jones');

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($CustomerAdd->request);

$CustomerAdd->response($response);

ok ($CustomerAdd->responseok, 'Check response');


