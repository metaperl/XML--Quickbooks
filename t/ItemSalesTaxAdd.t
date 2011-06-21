#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::ItemSalesTaxAdd;

my $rxml = XML::Quickbooks::Generator::ItemSalesTaxAdd->new(warnxml => 1);

my $name = 'CO Tax';
my %opt = (TaxRate => '4.5');

$rxml->as_xml($name, \%opt);

use XML::Quickbooks::RequestProcessor;

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($rxml->request);

ok ($rxml->evaluate($response), 'Check response');

done_testing();
