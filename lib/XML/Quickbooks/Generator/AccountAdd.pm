package XML::Quickbooks::Generator::AccountAdd;

use Moose;

extends 'XML::Quickbooks::Generator';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $opt)=@_;

      AccountAddRq(
	  AccountAdd(
		     Name($opt->{name}),
		     AccountType($opt->{account_type})
		    ));
};
	       

1;
