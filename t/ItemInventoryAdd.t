#!/usr/bin/perl

use strict;
use warnings;

use t::lib::T;
use t::lib::U;

# Before adding inventory, we must add the accounts related to the inventory

use XML::Quickbooks::Generator::AccountAdd;

my @acct_type = qw(Income CostOfGoodsSold OtherCurrentAsset);
my %arg;

for my $acct_type (@acct_type) {


  warn $acct_type;

  my $Operation = XML::Quickbooks::Generator::AccountAdd->new(warnxml => 1);
  my $name = "Test $acct_type" . timestamp;
  my %localarg = (Name => $name, AccountType => $acct_type);
  $Operation->dumper(\%localarg);
  $Operation->submit(\%localarg);
  warn 'response ' . $Operation->response;
  $Operation->responseok or die $Operation->responsemsg;
  $acct_type = 'COGS' if $acct_type eq 'CostOfGoodsSold';
  $acct_type = 'Asset' if $acct_type eq 'OtherCurrentAsset';
  $arg{$acct_type . 'AccountRef'}{FullName} = $name;
}


use XML::Quickbooks::Generator::ItemInventoryAdd;

my $Op = XML::Quickbooks::Generator::ItemInventoryAdd->new(warnxml => 1);

$arg{Name} = "Test Inv " . datetimestamp();
$Op->dumper(\%arg);

$Op->submit(\%arg);

warn $Op->responsemsg;

ok ($Op->responseok, 'Check response');

done_testing();
