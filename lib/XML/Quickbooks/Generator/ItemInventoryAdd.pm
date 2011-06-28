package XML::Quickbooks::Generator::ItemInventoryAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Util';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
  my ($self, $opt)=@_;

  ItemInventoryAddRq(
    ItemInventoryAdd(
      Name($opt->{Name}),
      $self->accountRef(IncomeAccountRef => $opt),
      $self->accountRef(COGSAccountRef => $opt),
      $self->accountRef(AssetAccountRef => $opt),
     ));
};

sub accountRef {
  my($self, $tagname, $opt)=@_;
  
  my $X = XML::Generator->new(pretty    => 2);
  my $subhash = $opt->{$tagname};
  $X->$tagname(
    $self->hashrender(ListID => $subhash),
    $self->hashrender(FullName => $subhash)
   );

}
	       

1;
