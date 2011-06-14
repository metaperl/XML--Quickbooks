#!/usr/bin/perl

use warnings;
use strict;

use lib 't/tlib';

use Test::More 'no_plan';

#use XML::Generator;

use XML::Quickbooks;
use XML::Quickbooks::CustomerAdd;


my $CustomerAdd = XML::Quickbooks::CustomerAdd->new;
$CustomerAdd->as_xml('Matt Smith');
my $r = $CustomerAdd->process;

ok ($CustomerAdd->responseok, 'Check response');


