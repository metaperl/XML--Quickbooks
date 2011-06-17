package XML::Quickbooks::Generator::AddressData;
# ABSTRACT: role to produce Quickbooks address XML via XML::Generator

use Moose::Role;

use XML::Generator ':pretty';

sub address_data { 
  my($self,$row)=@_;

  Addr1($row->{address1}),
    Addr2($row->{address2}),
      City($row->{city}),
	State($row->{state}),
	  PostalCode($row->{zip});
}
    

1;
