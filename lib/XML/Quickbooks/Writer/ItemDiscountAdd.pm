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

    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(QBXML QBXMLMsgsRq ItemDiscountAddRq) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDiscountAddRq => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd;
    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDiscountAdd => @$attr );

    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_Name;
    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_IsActive;
    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ParentRef;
    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ItemDesc;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_SalesTaxCodeRef;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_DiscountRate;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_DiscountRatePercent;
    $self->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_AccountRef;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ExternalGUID;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_Name {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd Name) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Name => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_IsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ParentRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd ParentRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ParentRef => @$attr );

    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ParentRef_ListID;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ParentRef_FullName;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ParentRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd ParentRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ParentRef_FullName
{
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd ParentRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ItemDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd ItemDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemDesc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_SalesTaxCodeRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd SalesTaxCodeRef)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesTaxCodeRef => @$attr );

    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_SalesTaxCodeRef_ListID;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_SalesTaxCodeRef_FullName;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_SalesTaxCodeRef_ListID
{
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd SalesTaxCodeRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_SalesTaxCodeRef_FullName
{
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd SalesTaxCodeRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_DiscountRate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd DiscountRate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DiscountRate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_DiscountRatePercent
{
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd DiscountRatePercent)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( DiscountRatePercent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_AccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd AccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountRef => @$attr );

    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_AccountRef_ListID;
    $self
      ->_tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_AccountRef_FullName;
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_AccountRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd AccountRef ListID)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_AccountRef_FullName
{
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd AccountRef FullName)
    );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_ItemDiscountAdd_ExternalGUID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq ItemDiscountAdd ExternalGUID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExternalGUID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QBXML_QBXMLMsgsRq_ItemDiscountAddRq_IncludeRetElement {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(QBXML QBXMLMsgsRq ItemDiscountAddRq IncludeRetElement) );

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
