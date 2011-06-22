use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Generator::ItemSalesTaxAdd;

my $Operation = XML::Quickbooks::Generator::ItemSalesTaxAdd->new(
  warnrequest  => 1,
  warnresponse => 1
 );
my %arg = (
  Name => 'Test ' . datetimestamp,
  TaxRate => 4.53,
 );

$Operation->submit(\%arg);

ok ($Operation->responseok, 'Check response');

done_testing();
