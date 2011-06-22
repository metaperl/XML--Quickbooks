package XML::Quickbooks::Generator::VendorAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Util';

use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $opt)=@_;

    VendorAddRq(
		VendorAdd(
			  Name($opt->{Name}),
			  $self->maybeVendorTypeRef($opt)
		   ));
};

sub maybeVendorTypeRef {
  my($self,$opt)=@_;

  return unless $opt;
  return unless my $v = $opt->{VendorTypeRef};

  VendorTypeRef(
		$self->hashrender(ListID   => $v) ,
		$self->hashrender(FullName => $v)
	       );

}
1;
