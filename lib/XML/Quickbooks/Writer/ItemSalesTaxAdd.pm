package XML::Quickbooks::Writer::ItemSalesTaxAdd;
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

    $self->_tag_ItemSalesTaxAddRq;
    $self->writer->endTag;
}

sub _tag_ItemSalesTaxAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemSalesTaxAddRq => @$attr );

    $self->_tag_ItemSalesTaxAdd;
    $self->_tag_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_ItemSalesTaxAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemSalesTaxAdd => @$attr );

    $self->_tag_Name;
    $self->_tag_IsActive;
    $self->_tag_ItemDesc;
    $self->_tag_TaxRate;
    $self->_tag_TaxVendorRef;
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

sub _tag_ItemDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ItemDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDesc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_TaxRate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TaxRate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TaxRate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_TaxVendorRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TaxVendorRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TaxVendorRef => @$attr );

    $self->_tag_TaxVendorRef_ListID;
    $self->_tag_TaxVendorRef_FullName;
    $self->writer->endTag;
}

sub _tag_TaxVendorRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TaxVendorRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_TaxVendorRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TaxVendorRef FullName) );

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
