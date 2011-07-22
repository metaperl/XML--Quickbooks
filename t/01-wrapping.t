use t::lib::T;
use t::lib::U;

use XML::Quickbooks;

my $self = XML::Quickbooks->new;

my @class = qw(AccountAdd CustomerAdd EmployeeAdd InvoiceAdd ItemDiscountAdd
	       ItemInventoryAdd VendorAdd);

for my $class (@class) {
  my $object = $self->wnew($class);
  warn ref $object;
  my @exp =($class . 'Rq' , $class);
  $self->dumper(ref $object, $object->wrapping, \@exp);
  is_deeply( $object->wrapping, \@exp, 'compare hash wrapping' );
}




done_testing();
