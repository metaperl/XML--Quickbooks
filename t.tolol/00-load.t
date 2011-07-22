
use warnings;
use strict;

use Test::More;

my $package = 'XML::Quickbooks';
use_ok('XML::Quickbooks');
use_ok('XML::Quickbooks::Generator');

eval {require version};
diag("Testing $package ", $package->VERSION );


done_testing();