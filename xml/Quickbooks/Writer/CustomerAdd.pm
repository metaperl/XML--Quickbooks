package XML::Quickbooks::Writer::CustomerAdd;
use Moose;

with qw(XML::Writer::Compiler::AutoPackage);

extends qw(lib);

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

    my $elementdata = $self->DIVE( $root, qw(QBXML) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXML => @$attr );

    $self->tagQBXMLMsgsRq;
    $self->writer->endTag;
}

sub tagQBXMLMsgsRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(QBXML QBXMLMsgsRq) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXMLMsgsRq => @$attr );

    $self->tagCustomerAddRq;
    $self->writer->endTag;
}

sub tagCustomerAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(QBXML QBXMLMsgsRq CustomerAddRq) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerAddRq => @$attr );

    $self->tagCustomerAdd;
    $self->tagIncludeRetElement;
    $self->writer->endTag;
}

sub tagCustomerAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerAdd => @$attr );

    $self->tagName;
    $self->tagIsActive;
    $self->tagParentRef;
    $self->tagCompanyName;
    $self->tagSalutation;
    $self->tagFirstName;
    $self->tagMiddleName;
    $self->tagLastName;
    $self->tagBillAddress;
    $self->tagShipAddress;
    $self->tagPhone;
    $self->tagAltPhone;
    $self->tagFax;
    $self->tagEmail;
    $self->tagContact;
    $self->tagAltContact;
    $self->tagCustomerTypeRef;
    $self->tagTermsRef;
    $self->tagSalesRepRef;
    $self->tagOpenBalance;
    $self->tagOpenBalanceDate;
    $self->tagSalesTaxCodeRef;
    $self->tagItemSalesTaxRef;
    $self->tagResaleNumber;
    $self->tagAccountNumber;
    $self->tagCreditLimit;
    $self->tagPreferredPaymentMethodRef;
    $self->tagCreditCardInfo;
    $self->tagJobStatus;
    $self->tagJobStartDate;
    $self->tagJobProjectedEndDate;
    $self->tagJobEndDate;
    $self->tagJobDesc;
    $self->tagJobTypeRef;
    $self->tagNotes;
    $self->tagPriceLevelRef;
    $self->tagExternalGUID;
    $self->tagCurrencyRef;
    $self->writer->endTag;
}

sub tagName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Name) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Name => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagParentRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ParentRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ParentRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ParentRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ParentRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCompanyName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CompanyName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CompanyName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalutation {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Salutation) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Salutation => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFirstName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd FirstName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FirstName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMiddleName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd MiddleName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MiddleName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagLastName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd LastName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LastName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagBillAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress) );

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

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagState {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress PostalCode)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCountry {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNote {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd BillAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagShipAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress) );

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

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagState {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress PostalCode)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCountry {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNote {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ShipAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Phone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Phone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAltPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd AltPhone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltPhone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFax {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Fax) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Fax => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEmail {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Email) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Email => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagContact {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Contact) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Contact => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAltContact {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd AltContact) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltContact => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCustomerTypeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CustomerTypeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerTypeRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CustomerTypeRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CustomerTypeRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagTermsRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd TermsRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TermsRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd TermsRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd TermsRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalesRepRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd SalesRepRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesRepRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd SalesRepRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd SalesRepRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOpenBalance {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd OpenBalance) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalance => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOpenBalanceDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd OpenBalanceDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalanceDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalesTaxCodeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd SalesTaxCodeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesTaxCodeRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd SalesTaxCodeRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd SalesTaxCodeRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagItemSalesTaxRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ItemSalesTaxRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemSalesTaxRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ItemSalesTaxRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ItemSalesTaxRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagResaleNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ResaleNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ResaleNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccountNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd AccountNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCreditLimit {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditLimit) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditLimit => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPreferredPaymentMethodRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd PreferredPaymentMethodRef)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PreferredPaymentMethodRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd PreferredPaymentMethodRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd PreferredPaymentMethodRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCreditCardInfo {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardInfo => @$attr );

    $self->tagCreditCardNumber;
    $self->tagExpirationMonth;
    $self->tagExpirationYear;
    $self->tagNameOnCard;
    $self->tagCreditCardAddress;
    $self->tagCreditCardPostalCode;
    $self->writer->endTag;
}

sub tagCreditCardNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo CreditCardNumber)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagExpirationMonth {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo ExpirationMonth)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExpirationMonth => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagExpirationYear {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo ExpirationYear)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExpirationYear => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNameOnCard {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo NameOnCard)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( NameOnCard => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCreditCardAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo CreditCardAddress)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardAddress => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCreditCardPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CreditCardInfo CreditCardPostalCode)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardPostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagJobStatus {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobStatus) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobStatus => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagJobStartDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobStartDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobStartDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagJobProjectedEndDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobProjectedEndDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobProjectedEndDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagJobEndDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobEndDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobEndDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagJobDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobDesc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagJobTypeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobTypeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobTypeRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobTypeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd JobTypeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNotes {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd Notes) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Notes => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPriceLevelRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd PriceLevelRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PriceLevelRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd PriceLevelRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd PriceLevelRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagExternalGUID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd ExternalGUID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExternalGUID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCurrencyRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CurrencyRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CurrencyRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CurrencyRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq CustomerAdd CurrencyRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIncludeRetElement {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq CustomerAddRq IncludeRetElement) );

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

sub tree {
    my $self = shift;
    my $href = shift;
    XML::Element->new_from_lol( $self->lol );
}

1;
