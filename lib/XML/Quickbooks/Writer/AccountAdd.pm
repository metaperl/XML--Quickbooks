package XML::Quickbooks::Writer::AccountAdd;
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

    my $elementdata = $self->DIVE( $root, qw(QBXML) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXML => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(QBXML QBXMLMsgsRq) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXMLMsgsRq => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(QBXML QBXMLMsgsRq AccountAddRq) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountAddRq => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountAdd => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_Name;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_IsActive;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_ParentRef;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_AccountType;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_AccountNumber;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_BankNumber;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_Desc;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_OpenBalance;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_OpenBalanceDate;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_TaxLineID;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_CurrencyRef;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_Name {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd Name) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Name => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_IsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_ParentRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd ParentRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ParentRef => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_ParentRef_ListID;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_ParentRef_FullName;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_ParentRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd ParentRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_ParentRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd ParentRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_AccountType {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd AccountType) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountType => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_AccountNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd AccountNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_BankNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd BankNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BankNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_Desc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd Desc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Desc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_OpenBalance {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd OpenBalance) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalance => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_OpenBalanceDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd OpenBalanceDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OpenBalanceDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_TaxLineID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd TaxLineID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TaxLineID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_CurrencyRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd CurrencyRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CurrencyRef => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_CurrencyRef_ListID;
    $self->_tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_CurrencyRef_FullName;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_CurrencyRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd CurrencyRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_AccountAdd_CurrencyRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq AccountAdd CurrencyRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_AccountAddRq_IncludeRetElement {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq AccountAddRq IncludeRetElement) );

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
