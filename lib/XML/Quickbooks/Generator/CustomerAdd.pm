package XML::Quickbooks::Generator::CustomerAdd;

use Moose;

extends 'XML::Quickbooks::Generator';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $opt)=@_;

      CustomerAddRq(
	  CustomerAdd(
	      Name($opt->{name})));
};
	       

1;
