package XML::Quickbooks::Generator::AccountAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Util';

use XML::Generator ':pretty';

augment 'as_xml' => sub {
    my ($self, $opt)=@_;

      AccountAddRq(
	  AccountAdd(
		     Name($self->trunc(31,$opt->{Name})),
		     AccountType($self->trunc(31, $opt->{AccountType}))
		    ));
};
	       

1;
