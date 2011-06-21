package XML::Quickbooks::Generator::ItemInventoryAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Generator::Util';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
  my ($self, $opt)=@_;

  ItemInventoryAddRq(
    ItemInventoryAdd(
      Name($opt->{name}),
      IncomeAccountRef(
	$self->hashrender(ListID => $opt),
	$self->hashrender(FullName => $opt)
       )

     ));
};
	       

1;
