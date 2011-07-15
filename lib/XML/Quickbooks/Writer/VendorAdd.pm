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

    $self->tagVendorAddRq;
    $self->writer->endTag;
}

sub tagVendorAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorAddRq => @$attr );

    $self->tagVendorAdd;
    $self->tagIncludeRetElement;
    $self->writer->endTag;
}

sub tagVendorAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorAdd => @$attr );

    $self->tagName;
    $self->tagIsActive;
    $self->tagCompanyName;
    $self->tagSalutation;
    $self->tagFirstName;
    $self->tagMiddleName;
    $self->tagLastName;
    $self->tagVendorAddress;
    $self->tagPhone;
    $self->tagAltPhone;
    $self->tagFax;
    $self->tagEmail;
    $self->tagContact;
    $self->tagAltContact;
    $self->tagNameOnCheck;
    $self->tagAccountNumber;
    $self->tagNotes;
    $self->tagVendorTypeRef;
    $self->tagTermsRef;
    $self->tagCreditLimit;
    $self->tagVendorTaxIdent;
    $self->tagIsVendorEligibleFor1099;
    $self->tagOpenBalance;
    $self->tagOpenBalanceDate;
    $self->tagBillingRateRef;
    $self->tagExternalGUID;
    $self->tagPrefillAccountRef;
    $self->tagCurrencyRef;
    $self->writer->endTag;
}

sub tagName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Name) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Name => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCompanyName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CompanyName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CompanyName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalutation {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Salutation) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Salutation => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFirstName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FirstName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FirstName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMiddleName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(MiddleName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MiddleName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagLastName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(LastName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LastName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagVendorAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorAddress => @$attr );

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

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr3 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr3) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr3 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr4 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr4) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr4 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr5 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Addr5) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr5 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagState {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCountry {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Country) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Country => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNote {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorAddress Note) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Note => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Phone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Phone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAltPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AltPhone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltPhone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFax {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Fax) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Fax => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEmail {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Email) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Email => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagContact {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Contact) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Contact => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAltContact {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AltContact) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltContact => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNameOnCheck {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(NameOnCheck) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( NameOnCheck => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccountNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNotes {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Notes) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Notes => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagVendorTypeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTypeRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorTypeRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTypeRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTypeRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

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

sub tagCreditLimit {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CreditLimit) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CreditLimit => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagVendorTaxIdent {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(VendorTaxIdent) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VendorTaxIdent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsVendorEligibleFor1099 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsVendorEligibleFor1099) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsVendorEligibleFor1099 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOpenBalance {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(OpenBalance) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalance => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagOpenBalanceDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(OpenBalanceDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalanceDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagBillingRateRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BillingRateRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

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

sub tagPrefillAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefillAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PrefillAccountRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefillAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefillAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCurrencyRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CurrencyRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CurrencyRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CurrencyRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(CurrencyRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

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
