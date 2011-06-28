package XML::Quickbooks::Generator::ItemInventoryQuery;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Util';
with    'XML::Quickbooks::Query';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
  my $self = shift;
  my ($opt)=@_;

  ItemInventoryQueryRq(
    $self->maybeFullName($opt),
   );
};




1;
