package XML::Quickbooks::Writer::CustomerAdd;
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

sub _tag_QBXML {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXML => @$attr );

    $self->_tag_QBXMLMsgsRq;
    $self->writer->endTag;
}

sub _tag_QBXMLMsgsRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXMLMsgsRq => @$attr );

    $self->_tag_CustomerAddRq;
    $self->writer->endTag;
}

sub _tag_CustomerAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerAddRq => @$attr );

    $self->_tag_CustomerAdd;
    $self->_tag_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_CustomerAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerAdd => @$attr );

    $self->_tag_Name;
    $self->_tag_IsActive;
    $self->_tag_ParentRef;
    $self->_tag_CompanyName;
    $self->_tag_Salutation;
    $self->_tag_FirstName;
    $self->_tag_MiddleName;
    $self->_tag_LastName;
    $self->_tag_BillAddress;
    $self->_tag_ShipAddress;
    $self->_tag_Phone;
    $self->_tag_AltPhone;
    $self->_tag_Fax;
    $self->_tag_Email;
    $self->_tag_Contact;
    $self->_tag_AltContact;
    $self->_tag_CustomerTypeRef;
    $self->_tag_TermsRef;
    $self->_tag_SalesRepRef;
    $self->_tag_OpenBalance;
    $self->_tag_OpenBalanceDate;
    $self->_tag_SalesTaxCodeRef;
    $self->_tag_ItemSalesTaxRef;
    $self->_tag_ResaleNumber;
    $self->_tag_AccountNumber;
    $self->_tag_CreditLimit;
    $self->_tag_PreferredPaymentMethodRef;
    $self->_tag_CreditCardInfo;
    $self->_tag_JobStatus;
    $self->_tag_JobStartDate;
    $self->_tag_JobProjectedEndDate;
    $self->_tag_JobEndDate;
    $self->_tag_JobDesc;
    $self->_tag_JobTypeRef;
    $self->_tag_Notes;
    $self->_tag_PriceLevelRef;
    $self->_tag_ExternalGUID;
    $self->_tag_CurrencyRef;
    $self->writer->endTag;
}

sub _tag_Name {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Name) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Name => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_IsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ParentRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ParentRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ParentRef => @$attr );

    $self->_tag_ParentRef_ListID;
    $self->_tag_ParentRef_FullName;
    $self->writer->endTag;
}

sub _tag_ParentRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ParentRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ParentRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ParentRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CompanyName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CompanyName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CompanyName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Salutation {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Salutation) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Salutation => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_FirstName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FirstName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FirstName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_MiddleName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(MiddleName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MiddleName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_LastName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(LastName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LastName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BillAddress => @$attr );

    $self->_tag_BillAddress_Addr1;
    $self->_tag_BillAddress_Addr2;
    $self->_tag_BillAddress_Addr3;
    $self->_tag_BillAddress_Addr4;
    $self->_tag_BillAddress_Addr5;
    $self->_tag_BillAddress_City;
    $self->_tag_BillAddress_State;
    $self->_tag_BillAddress_PostalCode;
    $self->_tag_BillAddress_Country;
    $self->_tag_BillAddress_Note;
    $self->writer->endTag;
}

sub _tag_BillAddress_Addr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_Addr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_Addr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_Addr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_Addr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_City {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_State {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_PostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_Country {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillAddress_Note {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ShipAddress => @$attr );

    $self->_tag_ShipAddress_Addr1;
    $self->_tag_ShipAddress_Addr2;
    $self->_tag_ShipAddress_Addr3;
    $self->_tag_ShipAddress_Addr4;
    $self->_tag_ShipAddress_Addr5;
    $self->_tag_ShipAddress_City;
    $self->_tag_ShipAddress_State;
    $self->_tag_ShipAddress_PostalCode;
    $self->_tag_ShipAddress_Country;
    $self->_tag_ShipAddress_Note;
    $self->writer->endTag;
}

sub _tag_ShipAddress_Addr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_Addr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_Addr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_Addr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_Addr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_City {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_State {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_PostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_Country {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ShipAddress_Note {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ShipAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Phone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Phone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Phone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AltPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AltPhone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltPhone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Fax {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Fax) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Fax => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Email {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Email) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Email => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Contact {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Contact) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Contact => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AltContact {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AltContact) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltContact => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CustomerTypeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerTypeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CustomerTypeRef => @$attr );

    $self->_tag_CustomerTypeRef_ListID;
    $self->_tag_CustomerTypeRef_FullName;
    $self->writer->endTag;
}

sub _tag_CustomerTypeRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerTypeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CustomerTypeRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CustomerTypeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_TermsRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TermsRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TermsRef => @$attr );

    $self->_tag_TermsRef_ListID;
    $self->_tag_TermsRef_FullName;
    $self->writer->endTag;
}

sub _tag_TermsRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TermsRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_TermsRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TermsRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_SalesRepRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesRepRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesRepRef => @$attr );

    $self->_tag_SalesRepRef_ListID;
    $self->_tag_SalesRepRef_FullName;
    $self->writer->endTag;
}

sub _tag_SalesRepRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesRepRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_SalesRepRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesRepRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_OpenBalance {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(OpenBalance) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalance => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_OpenBalanceDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(OpenBalanceDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalanceDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_SalesTaxCodeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesTaxCodeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesTaxCodeRef => @$attr );

    $self->_tag_SalesTaxCodeRef_ListID;
    $self->_tag_SalesTaxCodeRef_FullName;
    $self->writer->endTag;
}

sub _tag_SalesTaxCodeRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesTaxCodeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_SalesTaxCodeRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesTaxCodeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ItemSalesTaxRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemSalesTaxRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemSalesTaxRef => @$attr );

    $self->_tag_ItemSalesTaxRef_ListID;
    $self->_tag_ItemSalesTaxRef_FullName;
    $self->writer->endTag;
}

sub _tag_ItemSalesTaxRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemSalesTaxRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ItemSalesTaxRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemSalesTaxRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ResaleNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ResaleNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ResaleNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AccountNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditLimit {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditLimit) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditLimit => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PreferredPaymentMethodRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PreferredPaymentMethodRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PreferredPaymentMethodRef => @$attr );

    $self->_tag_PreferredPaymentMethodRef_ListID;
    $self->_tag_PreferredPaymentMethodRef_FullName;
    $self->writer->endTag;
}

sub _tag_PreferredPaymentMethodRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(PreferredPaymentMethodRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PreferredPaymentMethodRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(PreferredPaymentMethodRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditCardInfo {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditCardInfo) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardInfo => @$attr );

    $self->_tag_CreditCardInfo_CreditCardNumber;
    $self->_tag_CreditCardInfo_ExpirationMonth;
    $self->_tag_CreditCardInfo_ExpirationYear;
    $self->_tag_CreditCardInfo_NameOnCard;
    $self->_tag_CreditCardInfo_CreditCardAddress;
    $self->_tag_CreditCardInfo_CreditCardPostalCode;
    $self->writer->endTag;
}

sub _tag_CreditCardInfo_CreditCardNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditCardInfo CreditCardNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditCardInfo_ExpirationMonth {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditCardInfo ExpirationMonth) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExpirationMonth => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditCardInfo_ExpirationYear {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditCardInfo ExpirationYear) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExpirationYear => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditCardInfo_NameOnCard {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditCardInfo NameOnCard) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( NameOnCard => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditCardInfo_CreditCardAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(CreditCardInfo CreditCardAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardAddress => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CreditCardInfo_CreditCardPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(CreditCardInfo CreditCardPostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditCardPostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobStatus {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobStatus) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobStatus => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobStartDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobStartDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobStartDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobProjectedEndDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobProjectedEndDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobProjectedEndDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobEndDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobEndDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobEndDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobDesc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobTypeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobTypeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( JobTypeRef => @$attr );

    $self->_tag_JobTypeRef_ListID;
    $self->_tag_JobTypeRef_FullName;
    $self->writer->endTag;
}

sub _tag_JobTypeRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobTypeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_JobTypeRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(JobTypeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Notes {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Notes) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Notes => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PriceLevelRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PriceLevelRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PriceLevelRef => @$attr );

    $self->_tag_PriceLevelRef_ListID;
    $self->_tag_PriceLevelRef_FullName;
    $self->writer->endTag;
}

sub _tag_PriceLevelRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PriceLevelRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PriceLevelRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PriceLevelRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ExternalGUID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ExternalGUID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExternalGUID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CurrencyRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CurrencyRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CurrencyRef => @$attr );

    $self->_tag_CurrencyRef_ListID;
    $self->_tag_CurrencyRef_FullName;
    $self->writer->endTag;
}

sub _tag_CurrencyRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CurrencyRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CurrencyRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CurrencyRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_IncludeRetElement {
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
    my $method = '_tag_QBXML';
    $self->$method;
    $self->writer->end;
    $self;
}

1;
