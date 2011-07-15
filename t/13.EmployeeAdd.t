#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Writer::EmployeeAdd;

my $tmpnam = "Test " . timestamp;
my $data =  {FirstName => $tmpnam,
	     LastName => "Last",
	   };
my $Operation = XML::Quickbooks::Writer::EmployeeAdd->new(data => $data, maxwarn());

#die Data::Dumper::Dumper($VendorAdd);

$Operation->process;

ok ($Operation->responseok, 'Check response');

done_testing();
