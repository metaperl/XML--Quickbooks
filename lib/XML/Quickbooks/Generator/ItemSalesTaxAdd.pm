package XML::Quickbooks::Generator::ItemSalesTaxAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Util';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
  my $self = shift;
  my ($name, $opt)=@_;

  ItemSalesTaxAddRq(
		ItemSalesTaxAdd(
			    Name($name),
			    $self->maybeTaxRate(@_),
			    $self->maybeTaxVendorRef(@_)
			   ));
};

sub maybeTaxRate {
  my($self,$name,$opt)=@_;

  return unless $opt;
  return unless my $v = $opt->{TaxRate}; # dont render tax rate of 0

  TaxRate($opt->{TaxRate});

}

sub maybeTaxVendorRef {
  my($self,$name,$opt)=@_;

  return unless $opt;
  return unless $opt->{TaxRate};

  use XML::Quickbooks::Generator::VendorAdd;

  my $rxml = XML::Quickbooks::Generator::VendorAdd->new(warnxml => 1);

  my $vendorname = 'State Tax';

  $rxml->as_xml($vendorname);

  use XML::Quickbooks::RequestProcessor;

  my $p = XML::Quickbooks::RequestProcessor->new;
  my ($response) = $p->process($rxml->request);

  $rxml->evaluate($response);
  my $t = $rxml->responsetree;
  my $elem = $t->look_down('_tag' => 'ListID');
  my ($listid) = $elem->content_list;

  TaxVendorRef(
		ListID($listid) ,
		FullName($vendorname)
	       );

}


1;
