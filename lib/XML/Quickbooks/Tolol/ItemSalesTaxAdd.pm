package XML::Quickbooks::Tolol::ItemSalesTaxAdd;
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
                ItemSalesTaxAddRq => DIVE( $root, qw() ),
                [
                    ItemSalesTaxAdd => DIVE( $root, qw() ),
                    [ Name     => DIVE( $root, qw(Name) ) ],
                    [ IsActive => DIVE( $root, qw(IsActive) ) ],
                    [ ItemDesc => DIVE( $root, qw(ItemDesc) ) ],
                    [ TaxRate  => DIVE( $root, qw(TaxRate) ) ],
                    [
                        TaxVendorRef => DIVE( $root, qw(TaxVendorRef) ),
                        [ ListID => DIVE( $root, qw(TaxVendorRef ListID) ) ],
                        [
                            FullName => DIVE( $root, qw(TaxVendorRef FullName) )
                        ]
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
