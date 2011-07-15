use t::lib::T;
use t::lib::U;

use XML::Quickbooks;

my $self = XML::Quickbooks->new;

my @class = qw(AccountAdd CustomerAdd EmployeeAdd InvoiceAdd ItemDiscountAdd 
	       ItemInventoryAdd VendorAdd);

for my $class (@class) {
  my $object = $self->wnew($class);
  warn ref $object;
  $self->dumper(ref $object, $object->wrapping);
}

is_deeply( 1, 2, 'compare hash wrapping' );

warn Data::Dumper::Dumper( $wrapped, $exp );
done_testing();
