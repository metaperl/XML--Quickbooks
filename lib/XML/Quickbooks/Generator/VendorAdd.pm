package XML::Quickbooks::Generator::VendorAdd;

use Moose;

extends 'XML::Quickbooks::Generator';

use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $name)=@_;

      VendorAddRq(
	  VendorAdd(
	      Name($name)));
};
	       

1;
