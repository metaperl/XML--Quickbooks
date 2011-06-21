#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

# Before adding inventory, we must add the accounts related to the inventory

use XML::Quickbooks::Generator::AccountAdd;

my @acct_type = qw(Income COGS Asset)
my %name;


for my $acct_type (@acct_type) {

  my $rxml = XML::Quickbooks::Generator::AccountAdd->new();
  $name{$acct_type} = "Test $account_type" . datetime;
  my %arg = (name => $name{$account_type}, account_type $account_type);
  $rxml->process(%arg);

}


use XML::Quickbooks::Generator::ItemInventoryAdd;

my $rxml = XML::Quickbooks::Generator::ItemInventoryAdd->new(warnxml => 1);

my $tmpnam = "Test Inv " . datetimestamp();

$rxml->as_xml($tmpnam);

use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($rxml->request);

$rxml->response($response);

ok ($rxml->responseok, 'Check response');

done_testing();
