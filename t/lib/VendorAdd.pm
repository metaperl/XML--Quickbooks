package t::lib::VendorAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Generator::AddressData';

use XML::Generator ':pretty';

augment 'as_xml' => sub {
  my ($self, $row)=@_;

  VendorAddRq(
		VendorAdd(
			  Name($row->{firstname} . ' ' . $row->{lastname}),
			  VendorAddress($self->address_data($row)),
			   ))
}
  ;


1;
