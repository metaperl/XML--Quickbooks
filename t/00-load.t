
use warnings;
use strict;

use Test::More tests => 1;

my $package = 'XML::Quickbooks';
use_ok('XML::Quickbooks') or BAIL_OUT('cannot load XML::Quickbooks');

eval {require version};
diag("Testing $package ", $package->VERSION );


