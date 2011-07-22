package XML::Quickbooks::Writer::VendorAdd;
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

    $self->_tag_VendorAddRq;
    $self->writer->endTag;
}

sub _tag_VendorAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorAddRq => @$attr );

    $self->_tag_VendorAdd;
    $self->_tag_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_VendorAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorAdd => @$attr );

    $self->_tag_Name;
    $self->_tag_IsActive;
    $self->_tag_CompanyName;
    $self->_tag_Salutation;
    $self->_tag_FirstName;
    $self->_tag_MiddleName;
    $self->_tag_LastName;
    $self->_tag_VendorAddress;
    $self->_tag_Phone;
    $self->_tag_AltPhone;
    $self->_tag_Fax;
    $self->_tag_Email;
    $self->_tag_Contact;
    $self->_tag_AltContact;
    $self->_tag_NameOnCheck;
    $self->_tag_AccountNumber;
    $self->_tag_Notes;
    $self->_tag_VendorTypeRef;
    $self->_tag_TermsRef;
    $self->_tag_CreditLimit;
    $self->_tag_VendorTaxIdent;
    $self->_tag_IsVendorEligibleFor1099;
    $self->_tag_OpenBalance;
    $self->_tag_OpenBalanceDate;
    $self->_tag_BillingRateRef;
    $self->_tag_ExternalGUID;
    $self->_tag_PrefillAccountRef;
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

sub _tag_VendorAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorAddress => @$attr );

    $self->_tag_VendorAddress_Addr1;
    $self->_tag_VendorAddress_Addr2;
    $self->_tag_VendorAddress_Addr3;
    $self->_tag_VendorAddress_Addr4;
    $self->_tag_VendorAddress_Addr5;
    $self->_tag_VendorAddress_City;
    $self->_tag_VendorAddress_State;
    $self->_tag_VendorAddress_PostalCode;
    $self->_tag_VendorAddress_Country;
    $self->_tag_VendorAddress_Note;
    $self->writer->endTag;
}

sub _tag_VendorAddress_Addr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_Addr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_Addr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_Addr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_Addr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_City {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_State {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_PostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_Country {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorAddress_Note {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Note) );

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

sub _tag_NameOnCheck {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(NameOnCheck) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( NameOnCheck => @$attr );

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

sub _tag_Notes {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Notes) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Notes => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorTypeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTypeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorTypeRef => @$attr );

    $self->_tag_VendorTypeRef_ListID;
    $self->_tag_VendorTypeRef_FullName;
    $self->writer->endTag;
}

sub _tag_VendorTypeRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTypeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorTypeRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTypeRef FullName) );

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

sub _tag_CreditLimit {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditLimit) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditLimit => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_VendorTaxIdent {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTaxIdent) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorTaxIdent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_IsVendorEligibleFor1099 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsVendorEligibleFor1099) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsVendorEligibleFor1099 => @$attr );

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

sub _tag_BillingRateRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BillingRateRef => @$attr );

    $self->_tag_BillingRateRef_ListID;
    $self->_tag_BillingRateRef_FullName;
    $self->writer->endTag;
}

sub _tag_BillingRateRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillingRateRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef FullName) );

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

sub _tag_PrefillAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefillAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PrefillAccountRef => @$attr );

    $self->_tag_PrefillAccountRef_ListID;
    $self->_tag_PrefillAccountRef_FullName;
    $self->writer->endTag;
}

sub _tag_PrefillAccountRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefillAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PrefillAccountRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefillAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

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
