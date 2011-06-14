package XML::Quickbooks::CustomerAdd;

use Moose;

extends 'XML::Quickbooks';

use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $name)=@_;

      CustomerAddRq(
	  CustomerAdd(
	      Name($name)));
};
	       

1;
