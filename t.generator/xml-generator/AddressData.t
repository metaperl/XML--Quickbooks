#!/usr/bin/perl

use t::lib::T;
use t::lib::U;
use t::lib::VendorAdd;


my $rxml = t::lib::VendorAdd->new;


my %row = ( firstname => 'Test',
	    lastname => 'Role',
	    address1 => '1 Holly Berry Fine',
	    city => 'Tuscaloosa',
	    state => 'Ofmind',
	    zip => 12345
	  );

$rxml->as_xml(\%row);

my $expected=<<'EOXML';
<?xml version="1.0" encoding="utf-8"?> <?qbxml version="10.0"?> <QBXML>
   <QBXMLMsgsRq onError="stopOnError">
     <VendorAddRq>
       <VendorAdd>
         <Name>Test Role</Name>
         <VendorAddress>
           <Addr1>1 Holly Berry Fine</Addr1>

           <City>Tuscaloosa</City>
           <State>Ofmind</State>
           <PostalCode>12345</PostalCode>
         </VendorAddress>
       </VendorAdd>
     </VendorAddRq>
   </QBXMLMsgsRq>
 </QBXML>
EOXML

is_xml ($rxml->request, $expected, 'Check request used role');

done_testing();
