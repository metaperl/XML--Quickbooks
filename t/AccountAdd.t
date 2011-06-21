#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::AccountAdd;

my $rxml = XML::Quickbooks::Generator::AccountAdd->new(warnxml => 1);

my $tmpnam = "Test " . datetimestamp();
my $account_type = 'Income';

$rxml->as_xml({name => $tmpnam,  account_type => $account_type});

use XML::Quickbooks::RequestProcessor;

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($rxml->request);

ok ($rxml->evaluate($response), 'Check response');

done_testing();
