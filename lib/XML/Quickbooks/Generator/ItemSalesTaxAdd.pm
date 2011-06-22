package XML::Quickbooks::Generator::ItemSalesTaxAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Util';


use XML::Generator ':pretty';

augment 'as_xml' => sub {
  my $self = shift;
  my ($opt)=@_;

  ItemSalesTaxAddRq(
		ItemSalesTaxAdd(
			    Name($opt->{Name}),
			    $self->maybeTaxRate(@_),
			    $self->maybeTaxVendorRef(@_)
			   ));
};

sub maybeTaxRate {
  my($self,$opt)=@_;

  return unless $opt;
  return unless my $v = $opt->{TaxRate}; # dont render tax rate of 0

  TaxRate($opt->{TaxRate});

}

sub maybeTaxVendorRef {
  my($self,$opt)=@_;

  return unless $opt;
  return unless $opt->{TaxRate};

  use XML::Quickbooks::Generator::VendorAdd;

  my $listid;

  my $vendorname = 'State Tax';
  my $args = { Name => $vendorname };

  use XML::Quickbooks::Generator::VendorQuery;
  my $VQ = XML::Quickbooks::Generator::VendorQuery->new;

  if ($VQ->exists( $args )) {
    $listid = $VQ->responselistid;
  } else {

    my $VA = XML::Quickbooks::Generator::VendorAdd->new(warnxml => 1);
    $VA->submit( $args );
    $listid = $VA->responselistid;
  }

  TaxVendorRef(
		ListID($listid) ,
		FullName($vendorname)
	       );

}


1;
