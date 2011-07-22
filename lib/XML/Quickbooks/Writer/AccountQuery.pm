package XML::Quickbooks::Writer::AccountQuery;
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

    $self->_tag_AccountQueryRq;
    $self->writer->endTag;
}

sub _tag_AccountQueryRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountQueryRq => @$attr );

    $self->_tag_ListID;
    $self->_tag_FullName;
    $self->_tag_MaxReturned;
    $self->_tag_ActiveStatus;
    $self->_tag_FromModifiedDate;
    $self->_tag_ToModifiedDate;
    $self->_tag_NameFilter;
    $self->_tag_NameRangeFilter;
    $self->_tag_AccountType;
    $self->_tag_CurrencyFilter;
    $self->_tag_IncludeRetElement;
    $self->_tag_OwnerID;
    $self->writer->endTag;
}

sub _tag_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_MaxReturned {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MaxReturned => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ActiveStatus {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ActiveStatus => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_FromModifiedDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FromModifiedDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ToModifiedDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ToModifiedDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_NameFilter {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( NameFilter => @$attr );

    $self->_tag_MatchCriterion;
    $self->_tag_Name;
    $self->writer->endTag;
}

sub _tag_MatchCriterion {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(MatchCriterion) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MatchCriterion => @$attr );

    $self->writer->characters($data);
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

sub _tag_NameRangeFilter {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( NameRangeFilter => @$attr );

    $self->_tag_FromName;
    $self->_tag_ToName;
    $self->writer->endTag;
}

sub _tag_FromName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FromName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FromName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ToName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ToName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ToName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AccountType {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountType => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_CurrencyFilter {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( CurrencyFilter => @$attr );

    $self->_tag_ListID;
    $self->_tag_FullName;
    $self->writer->endTag;
}

sub _tag_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FullName) );

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

sub _tag_OwnerID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( OwnerID => @$attr );

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
