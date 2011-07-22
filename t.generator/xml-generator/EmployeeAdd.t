#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::EmployeeAdd;

my $EmployeeAdd = XML::Quickbooks::Generator::EmployeeAdd->new(warnxml=>1);


my %row = (userfullname => sprintf 'Test %s %s', 
	   Data::Random::rand_words,
	   Data::Random::rand_words);

use Data::Dumper;
warn Dumper(\%row);

$EmployeeAdd->as_xml(\%row);


use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($EmployeeAdd->request);

ok ($EmployeeAdd->evaluate($response), 'Check response');

done_testing();
