package XML::Quickbooks::Writer::ItemDiscountAdd;
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

    $self->_tag_ItemDiscountAddRq;
    $self->writer->endTag;
}

sub _tag_ItemDiscountAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDiscountAddRq => @$attr );

    $self->_tag_ItemDiscountAdd;
    $self->_tag_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_ItemDiscountAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDiscountAdd => @$attr );

    $self->_tag_Name;
    $self->_tag_IsActive;
    $self->_tag_ParentRef;
    $self->_tag_ItemDesc;
    $self->_tag_SalesTaxCodeRef;
    $self->_tag_DiscountRate;
    $self->_tag_DiscountRatePercent;
    $self->_tag_AccountRef;
    $self->_tag_ExternalGUID;
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

sub _tag_ItemDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDesc => @$attr );

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

sub _tag_DiscountRate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(DiscountRate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DiscountRate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_DiscountRatePercent {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(DiscountRatePercent) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DiscountRatePercent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountRef => @$attr );

    $self->_tag_AccountRef_ListID;
    $self->_tag_AccountRef_FullName;
    $self->writer->endTag;
}

sub _tag_AccountRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AccountRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountRef FullName) );

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
