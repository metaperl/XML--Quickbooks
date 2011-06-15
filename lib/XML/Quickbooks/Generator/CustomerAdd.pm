package XML::Quickbooks::Generator::CustomerAdd;

use Moose;

extends 'XML::Quickbooks::Generator';

use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $name)=@_;

      CustomerAddRq(
	  CustomerAdd(
	      Name($name)));
};
	       

1;
