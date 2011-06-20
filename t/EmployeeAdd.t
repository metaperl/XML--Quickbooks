#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::EmployeeAdd;

my $EmployeeAdd = XML::Quickbooks::Generator::EmployeeAdd->new;

my %row = (userfullname => 'John James' . datetimestamp);

$EmployeeAdd->as_xml(\%row);

warn "XML" . $EmployeeAdd->request;


use XML::Quickbooks::RequestProcessor; 

my $p = XML::Quickbooks::RequestProcessor->new;
my ($response) = $p->process($EmployeeAdd->request);

ok ($EmployeeAdd->evaluate($response), 'Check response');

done_testing();
