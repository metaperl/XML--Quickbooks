#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::CustomerAdd;

my $CustomerAdd = XML::Quickbooks::Generator::CustomerAdd->new;

# Intentionally make customer name too long so an error is thrown
use UUID::Tiny;
my $tmpnam = substr("TestCustomer " . create_UUID_as_string(UUID_V1), 0 , 80);


$CustomerAdd->as_xml($tmpnam);

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($CustomerAdd->request);

#warn "r: $response";

sub mytest {
    if (
	(not $CustomerAdd->evaluate($response)) &&
	($CustomerAdd->responseerror =~ /too long/)) {
      1;
    } else {
      0;
    }
  }



ok (mytest, 'evaluaton of response must be failure based on data being too long');

done_testing();
