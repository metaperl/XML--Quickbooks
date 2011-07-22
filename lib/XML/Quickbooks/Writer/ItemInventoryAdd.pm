package XML::Quickbooks::Writer::ItemInventoryAdd;
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

    $self->_tag_ItemInventoryAddRq;
    $self->writer->endTag;
}

sub _tag_ItemInventoryAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemInventoryAddRq => @$attr );

    $self->_tag_ItemInventoryAdd;
    $self->_tag_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_ItemInventoryAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ItemInventoryAdd => @$attr );

    $self->_tag_Name;
    $self->_tag_IsActive;
    $self->_tag_ParentRef;
    $self->_tag_ManufacturerPartNumber;
    $self->_tag_UnitOfMeasureSetRef;
    $self->_tag_SalesTaxCodeRef;
    $self->_tag_SalesDesc;
    $self->_tag_SalesPrice;
    $self->_tag_IncomeAccountRef;
    $self->_tag_PurchaseDesc;
    $self->_tag_PurchaseCost;
    $self->_tag_COGSAccountRef;
    $self->_tag_PrefVendorRef;
    $self->_tag_AssetAccountRef;
    $self->_tag_ReorderPoint;
    $self->_tag_QuantityOnHand;
    $self->_tag_TotalValue;
    $self->_tag_InventoryDate;
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

sub _tag_ManufacturerPartNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ManufacturerPartNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ManufacturerPartNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_UnitOfMeasureSetRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(UnitOfMeasureSetRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( UnitOfMeasureSetRef => @$attr );

    $self->_tag_UnitOfMeasureSetRef_ListID;
    $self->_tag_UnitOfMeasureSetRef_FullName;
    $self->writer->endTag;
}

sub _tag_UnitOfMeasureSetRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(UnitOfMeasureSetRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_UnitOfMeasureSetRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(UnitOfMeasureSetRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

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

sub _tag_SalesDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesDesc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_SalesPrice {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SalesPrice) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SalesPrice => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_IncomeAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IncomeAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IncomeAccountRef => @$attr );

    $self->_tag_IncomeAccountRef_ListID;
    $self->_tag_IncomeAccountRef_FullName;
    $self->writer->endTag;
}

sub _tag_IncomeAccountRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IncomeAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_IncomeAccountRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IncomeAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PurchaseDesc {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PurchaseDesc) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PurchaseDesc => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PurchaseCost {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PurchaseCost) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PurchaseCost => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_COGSAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(COGSAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( COGSAccountRef => @$attr );

    $self->_tag_COGSAccountRef_ListID;
    $self->_tag_COGSAccountRef_FullName;
    $self->writer->endTag;
}

sub _tag_COGSAccountRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(COGSAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_COGSAccountRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(COGSAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PrefVendorRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefVendorRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PrefVendorRef => @$attr );

    $self->_tag_PrefVendorRef_ListID;
    $self->_tag_PrefVendorRef_FullName;
    $self->writer->endTag;
}

sub _tag_PrefVendorRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefVendorRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PrefVendorRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrefVendorRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AssetAccountRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AssetAccountRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AssetAccountRef => @$attr );

    $self->_tag_AssetAccountRef_ListID;
    $self->_tag_AssetAccountRef_FullName;
    $self->writer->endTag;
}

sub _tag_AssetAccountRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AssetAccountRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AssetAccountRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AssetAccountRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ReorderPoint {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ReorderPoint) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ReorderPoint => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_QuantityOnHand {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(QuantityOnHand) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QuantityOnHand => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_TotalValue {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(TotalValue) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( TotalValue => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_InventoryDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(InventoryDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( InventoryDate => @$attr );

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
