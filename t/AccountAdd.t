#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::AccountAdd;

my $rxml = XML::Quickbooks::Generator::AccountAdd->new(warnxml => 1);

my $tmpnam = "Test " . timestamp();
my $account_type = 'Income';

$rxml->as_xml({Name => $tmpnam, AccountType => $account_type});

use XML::Quickbooks::RequestProcessor;

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($rxml->request);

ok ($rxml->evaluate($response), 'Check response');

done_testing();
