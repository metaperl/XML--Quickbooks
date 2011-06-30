package XML::Quickbooks::Tolol::VendorQuery;
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
                VendorQueryRq => DIVE( $root, qw() ),
                [ ListID           => DIVE( $root, qw(ListID) ) ],
                [ FullName         => DIVE( $root, qw(FullName) ) ],
                [ MaxReturned      => DIVE( $root, qw(MaxReturned) ) ],
                [ ActiveStatus     => DIVE( $root, qw(ActiveStatus) ) ],
                [ FromModifiedDate => DIVE( $root, qw(FromModifiedDate) ) ],
                [ ToModifiedDate   => DIVE( $root, qw(ToModifiedDate) ) ],
                [
                    NameFilter => DIVE( $root, qw(NameFilter) ),
                    [
                        MatchCriterion =>
                          DIVE( $root, qw(NameFilter MatchCriterion) )
                    ],
                    [ Name => DIVE( $root, qw(NameFilter Name) ) ]
                ],
                [
                    NameRangeFilter => DIVE( $root, qw(NameRangeFilter) ),
                    [ FromName => DIVE( $root, qw(NameRangeFilter FromName) ) ],
                    [ ToName   => DIVE( $root, qw(NameRangeFilter ToName) ) ]
                ],
                [
                    TotalBalanceFilter => DIVE( $root, qw(TotalBalanceFilter) ),
                    [
                        Operator =>
                          DIVE( $root, qw(TotalBalanceFilter Operator) )
                    ],
                    [ Amount => DIVE( $root, qw(TotalBalanceFilter Amount) ) ]
                ],
                [
                    CurrencyFilter => DIVE( $root, qw(CurrencyFilter) ),
                    [ ListID   => DIVE( $root, qw(CurrencyFilter ListID) ) ],
                    [ FullName => DIVE( $root, qw(CurrencyFilter FullName) ) ]
                ],
                [ IncludeRetElement => DIVE( $root, qw(IncludeRetElement) ) ],
                [ OwnerID           => DIVE( $root, qw(OwnerID) ) ]
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
