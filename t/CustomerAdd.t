#!/usr/bin/perl

use Test::More;

use XML::Quickbooks::Generator::CustomerAdd;

my $CustomerAdd = XML::Quickbooks::Generator::CustomerAdd->new;

use UUID::Tiny;
my $tmpnam = substr("TestCustomer " . create_UUID_as_string(UUID_V1), 0 , 40);
warn "tmpnam: $tmpnam";

$CustomerAdd->as_xml($tmpnam);

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($CustomerAdd->request);

$CustomerAdd->response($response);

ok ($CustomerAdd->responseok, 'Check response');

done_testing();
