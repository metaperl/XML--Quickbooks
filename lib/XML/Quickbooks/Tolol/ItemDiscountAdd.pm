package XML::Quickbooks::Tolol::ItemDiscountAdd;
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
                ItemDiscountAddRq => DIVE( $root, qw() ),
                [
                    ItemDiscountAdd => DIVE( $root, qw() ),
                    [ Name     => DIVE( $root, qw(Name) ) ],
                    [ IsActive => DIVE( $root, qw(IsActive) ) ],
                    [
                        ParentRef => DIVE( $root, qw(ParentRef) ),
                        [ ListID   => DIVE( $root, qw(ParentRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(ParentRef FullName) ) ]
                    ],
                    [ ItemDesc => DIVE( $root, qw(ItemDesc) ) ],
                    [
                        SalesTaxCodeRef => DIVE( $root, qw(SalesTaxCodeRef) ),
                        [ ListID => DIVE( $root, qw(SalesTaxCodeRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(SalesTaxCodeRef FullName) )
                        ]
                    ],
                    [ DiscountRate => DIVE( $root, qw(DiscountRate) ) ],
                    [
                        DiscountRatePercent =>
                          DIVE( $root, qw(DiscountRatePercent) )
                    ],
                    [
                        AccountRef => DIVE( $root, qw(AccountRef) ),
                        [ ListID   => DIVE( $root, qw(AccountRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(AccountRef FullName) ) ]
                    ],
                    [ ExternalGUID => DIVE( $root, qw(ExternalGUID) ) ]
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
