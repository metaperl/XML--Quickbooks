package XML::Quickbooks::Writer::InvoiceAdd;
use Moose;

with qw(XML::Writer::Compiler::AutoPackage);

extends qw(XML::Quickbooks::Writer);

use Data::Dumper;
use HTML::Element::Library;

use XML::Element;

has 'data' => (
    is      => 'rw',
    trigger => \&maybe_morph
);
has 'writer' => ( is => 'rw', isa => 'XML::Writer' );
has 'string' => ( is => 'rw', isa => 'XML::Writer::String' );

sub tagQBXML {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXML => @$attr );

    $self->tagQBXMLMsgsRq;
    $self->writer->endTag;
}

sub tagQBXMLMsgsRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXMLMsgsRq => @$attr );

    $self->tagInvoiceAddRq;
    $self->writer->endTag;
}

sub tagInvoiceAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InvoiceAddRq => @$attr );

    $self->tagInvoiceAdd;
    $self->tagIncludeRetElement;
    $self->writer->endTag;
}

sub tagInvoiceAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InvoiceAdd => @$attr );

    $self->tagCustomerRef;
    $self->tagClassRef;
    $self->tagARAccountRef;
    $self->tagTemplateRef;
    $self->tagTxnDate;
    $self->tagRefNumber;
    $self->tagBillAddress;
    $self->tagShipAddress;
    $self->tagIsPending;
    $self->tagIsFinanceCharge;
    $self->tagPONumber;
    $self->tagTermsRef;
    $self->tagDueDate;
    $self->tagSalesRepRef;
    $self->tagFOB;
    $self->tagShipDate;
    $self->tagShipMethodRef;
    $self->tagItemSalesTaxRef;
    $self->tagMemo;
    $self->tagCustomerMsgRef;
    $self->tagIsToBePrinted;
    $self->tagIsToBeEmailed;
    $self->tagCustomerSalesTaxCodeRef;
    $self->tagOther;
    $self->tagExchangeRate;
    $self->tagExternalGUID;
    $self->tagLinkToTxnID;
    $self->tagSetCredit;
    $self->tagInvoiceLineAdd;
    $self->tagInvoiceLineGroupAdd;
    $self->writer->endTag;
}

sub tagCustomerRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagClassRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ClassRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ClassRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ClassRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ClassRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagARAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ARAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ARAccountRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ARAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ARAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagTemplateRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TemplateRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TemplateRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TemplateRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TemplateRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagTxnDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TxnDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TxnDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagRefNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(RefNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( RefNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagBillAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BillAddress => @$attr );

    $self->tagAddr1;
    $self->tagAddr2;
    $self->tagAddr3;
    $self->tagAddr4;
    $self->tagAddr5;
    $self->tagCity;
    $self->tagState;
    $self->tagPostalCode;
    $self->tagCountry;
    $self->tagNote;
    $self->writer->endTag;
}

sub tagAddr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagState {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCountry {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNote {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagShipAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ShipAddress => @$attr );

    $self->tagAddr1;
    $self->tagAddr2;
    $self->tagAddr3;
    $self->tagAddr4;
    $self->tagAddr5;
    $self->tagCity;
    $self->tagState;
    $self->tagPostalCode;
    $self->tagCountry;
    $self->tagNote;
    $self->writer->endTag;
}

sub tagAddr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagState {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCountry {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNote {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsPending {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsPending) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsPending => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsFinanceCharge {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsFinanceCharge) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsFinanceCharge => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPONumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PONumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PONumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagTermsRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TermsRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TermsRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TermsRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TermsRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDueDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(DueDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DueDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalesRepRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesRepRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesRepRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesRepRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesRepRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFOB {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FOB) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FOB => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagShipDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ShipDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagShipMethodRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipMethodRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ShipMethodRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipMethodRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipMethodRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagItemSalesTaxRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemSalesTaxRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemSalesTaxRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemSalesTaxRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemSalesTaxRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMemo {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Memo) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Memo => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCustomerMsgRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerMsgRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerMsgRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerMsgRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerMsgRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsToBePrinted {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsToBePrinted) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsToBePrinted => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsToBeEmailed {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsToBeEmailed) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsToBeEmailed => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCustomerSalesTaxCodeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerSalesTaxCodeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerSalesTaxCodeRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerSalesTaxCodeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(CustomerSalesTaxCodeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOther {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Other) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Other => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagExchangeRate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ExchangeRate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExchangeRate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagExternalGUID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ExternalGUID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExternalGUID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagLinkToTxnID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(LinkToTxnID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LinkToTxnID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSetCredit {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SetCredit) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SetCredit => @$attr );

    $self->tagCreditTxnID;
    $self->tagAppliedAmount;
    $self->tagOverride;
    $self->writer->endTag;
}

sub tagCreditTxnID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SetCredit CreditTxnID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditTxnID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAppliedAmount {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SetCredit AppliedAmount) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AppliedAmount => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOverride {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SetCredit Override) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Override => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagInvoiceLineAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InvoiceLineAdd => @$attr );

    $self->tagItemRef;
    $self->tagDesc;
    $self->tagQuantity;
    $self->tagUnitOfMeasure;
    $self->tagRate;
    $self->tagRatePercent;
    $self->tagPriceLevelRef;
    $self->tagClassRef;
    $self->tagAmount;
    $self->tagInventorySiteRef;
    $self->tagServiceDate;
    $self->tagSalesTaxCodeRef;
    $self->tagOverrideItemAccountRef;
    $self->tagOther1;
    $self->tagOther2;
    $self->tagLinkToTxn;
    $self->tagDataExt;
    $self->writer->endTag;
}

sub tagItemRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd ItemRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd ItemRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd ItemRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd Desc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Desc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagQuantity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd Quantity) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Quantity => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagUnitOfMeasure {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd UnitOfMeasure) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( UnitOfMeasure => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagRate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd Rate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Rate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagRatePercent {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd RatePercent) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( RatePercent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPriceLevelRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd PriceLevelRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PriceLevelRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd PriceLevelRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd PriceLevelRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagClassRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd ClassRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ClassRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd ClassRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd ClassRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAmount {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd Amount) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Amount => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagInventorySiteRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd InventorySiteRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InventorySiteRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd InventorySiteRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd InventorySiteRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagServiceDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd ServiceDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ServiceDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalesTaxCodeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd SalesTaxCodeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesTaxCodeRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd SalesTaxCodeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd SalesTaxCodeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOverrideItemAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd OverrideItemAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OverrideItemAccountRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd OverrideItemAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd OverrideItemAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOther1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd Other1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Other1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOther2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd Other2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Other2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagLinkToTxn {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd LinkToTxn) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LinkToTxn => @$attr );

    $self->tagTxnID;
    $self->tagTxnLineID;
    $self->writer->endTag;
}

sub tagTxnID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd LinkToTxn TxnID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TxnID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagTxnLineID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd LinkToTxn TxnLineID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TxnLineID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDataExt {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd DataExt) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DataExt => @$attr );

    $self->tagOwnerID;
    $self->tagDataExtName;
    $self->tagDataExtValue;
    $self->writer->endTag;
}

sub tagOwnerID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineAdd DataExt OwnerID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OwnerID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDataExtName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd DataExt DataExtName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DataExtName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDataExtValue {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineAdd DataExt DataExtValue) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DataExtValue => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagInvoiceLineGroupAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineGroupAdd) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InvoiceLineGroupAdd => @$attr );

    $self->tagItemGroupRef;
    $self->tagQuantity;
    $self->tagUnitOfMeasure;
    $self->tagInventorySiteRef;
    $self->tagDataExt;
    $self->writer->endTag;
}

sub tagItemGroupRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd ItemGroupRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemGroupRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd ItemGroupRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd ItemGroupRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagQuantity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineGroupAdd Quantity) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Quantity => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagUnitOfMeasure {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd UnitOfMeasure) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( UnitOfMeasure => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagInventorySiteRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd InventorySiteRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InventorySiteRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd InventorySiteRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd InventorySiteRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDataExt {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InvoiceLineGroupAdd DataExt) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DataExt => @$attr );

    $self->tagOwnerID;
    $self->tagDataExtName;
    $self->tagDataExtValue;
    $self->writer->endTag;
}

sub tagOwnerID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd DataExt OwnerID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OwnerID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDataExtName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd DataExt DataExtName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DataExtName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagDataExtValue {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(InvoiceLineGroupAdd DataExt DataExtValue) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DataExtValue => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIncludeRetElement {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IncludeRetElement => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub xml {
    my ($self) = @_;
    my $method = 'tagQBXML';
    $self->$method;
    $self->writer->end;
    $self;
}

1;
