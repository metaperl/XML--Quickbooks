#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::CustomerAdd;

my $Operation = XML::Quickbooks::Generator::CustomerAdd->new(warnxml => 1);

# Intentionally make customer name too long so an error is thrown
use UUID::Tiny;
my $tmpnam = substr("TestCustomer " . create_UUID_as_string(UUID_V1), 0 , 80);


$Operation->as_xml({Name => $tmpnam});

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($Operation->request);

#warn "r: $response";

sub mytest {
    if (

	($Operation->responseerror =~ /too long/)) {
      1;
    } else {
      0;
    }
  }



is($Operation->evaluate($response), '', 'Evaluating response from request must fail');
like($Operation->responsemsg, qr/too long/, 'Reason for failure must say data was too long');

done_testing();
