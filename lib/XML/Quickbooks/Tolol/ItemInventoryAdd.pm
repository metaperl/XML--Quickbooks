package XML::Quickbooks::Tolol::ItemInventoryAdd;
use Moose;

extends qw(XML::Quickbooks::Tolol);

use Data::Diver qw( Dive DiveRef DiveError );
use XML::Element;

has 'data' => (
    is      => 'rw',
    isa     => 'HashRef',
    trigger => \&maybe_morph
);

sub DIVE {
    my $ref = Dive(@_);
    my $ret;

    #warn "DIVEREF: $ref";
    if ( ref $ref ) {
        $ret = '';
    }
    elsif ( not defined $ref ) {
        $ret = '';
    }
    else {
        $ret = $ref;
    }

    #warn "DIVERET: $ret";
    $ret;

}

sub maybe_morph {
    my ( $self, $data ) = @_;
    if ( $self->can('morph') ) {
        warn "MORPHING";
        $self->morph($data);
    }
}

sub lol {
    my ($self) = @_;

    my $root = $self->data;

    [
        QBXML => DIVE( $root, qw() ),
        [
            QBXMLMsgsRq => { 'onError' => 'stopOnError' } =>
              DIVE( $root, qw() ),
            [
                ItemInventoryAddRq => DIVE( $root, qw() ),
                [
                    ItemInventoryAdd => DIVE( $root, qw() ),
                    [ Name     => DIVE( $root, qw(Name) ) ],
                    [ IsActive => DIVE( $root, qw(IsActive) ) ],
                    [
                        ParentRef => DIVE( $root, qw(ParentRef) ),
                        [ ListID   => DIVE( $root, qw(ParentRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(ParentRef FullName) ) ]
                    ],
                    [
                        ManufacturerPartNumber =>
                          DIVE( $root, qw(ManufacturerPartNumber) )
                    ],
                    [
                        UnitOfMeasureSetRef =>
                          DIVE( $root, qw(UnitOfMeasureSetRef) ),
                        [
                            ListID =>
                              DIVE( $root, qw(UnitOfMeasureSetRef ListID) )
                        ],
                        [
                            FullName =>
                              DIVE( $root, qw(UnitOfMeasureSetRef FullName) )
                        ]
                    ],
                    [
                        SalesTaxCodeRef => DIVE( $root, qw(SalesTaxCodeRef) ),
                        [ ListID => DIVE( $root, qw(SalesTaxCodeRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(SalesTaxCodeRef FullName) )
                        ]
                    ],
                    [ SalesDesc  => DIVE( $root, qw(SalesDesc) ) ],
                    [ SalesPrice => DIVE( $root, qw(SalesPrice) ) ],
                    [
                        IncomeAccountRef => DIVE( $root, qw(IncomeAccountRef) ),
                        [
                            ListID => DIVE( $root, qw(IncomeAccountRef ListID) )
                        ],
                        [
                            FullName =>
                              DIVE( $root, qw(IncomeAccountRef FullName) )
                        ]
                    ],
                    [ PurchaseDesc => DIVE( $root, qw(PurchaseDesc) ) ],
                    [ PurchaseCost => DIVE( $root, qw(PurchaseCost) ) ],
                    [
                        COGSAccountRef => DIVE( $root, qw(COGSAccountRef) ),
                        [ ListID => DIVE( $root, qw(COGSAccountRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(COGSAccountRef FullName) )
                        ]
                    ],
                    [
                        PrefVendorRef => DIVE( $root, qw(PrefVendorRef) ),
                        [ ListID => DIVE( $root, qw(PrefVendorRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(PrefVendorRef FullName) )
                        ]
                    ],
                    [
                        AssetAccountRef => DIVE( $root, qw(AssetAccountRef) ),
                        [ ListID => DIVE( $root, qw(AssetAccountRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(AssetAccountRef FullName) )
                        ]
                    ],
                    [ ReorderPoint   => DIVE( $root, qw(ReorderPoint) ) ],
                    [ QuantityOnHand => DIVE( $root, qw(QuantityOnHand) ) ],
                    [ TotalValue     => DIVE( $root, qw(TotalValue) ) ],
                    [ InventoryDate  => DIVE( $root, qw(InventoryDate) ) ],
                    [ ExternalGUID   => DIVE( $root, qw(ExternalGUID) ) ]
                ],
                [ IncludeRetElement => DIVE( $root, qw() ) ]
            ]
        ]
    ]

}

sub tree {
    my $self = shift;
    my $href = shift;
    XML::Element->new_from_lol( $self->lol );
}

1;
