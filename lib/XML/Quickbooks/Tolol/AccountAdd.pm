package XML::Quickbooks::Tolol::AccountAdd;
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
                AccountAddRq => DIVE( $root, qw() ),
                [
                    AccountAdd => DIVE( $root, qw() ),
                    [ Name     => DIVE( $root, qw(Name) ) ],
                    [ IsActive => DIVE( $root, qw(IsActive) ) ],
                    [
                        ParentRef => DIVE( $root, qw(ParentRef) ),
                        [ ListID   => DIVE( $root, qw(ParentRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(ParentRef FullName) ) ]
                    ],
                    [ AccountType     => DIVE( $root, qw(AccountType) ) ],
                    [ AccountNumber   => DIVE( $root, qw(AccountNumber) ) ],
                    [ BankNumber      => DIVE( $root, qw(BankNumber) ) ],
                    [ Desc            => DIVE( $root, qw(Desc) ) ],
                    [ OpenBalance     => DIVE( $root, qw(OpenBalance) ) ],
                    [ OpenBalanceDate => DIVE( $root, qw(OpenBalanceDate) ) ],
                    [ TaxLineID       => DIVE( $root, qw(TaxLineID) ) ],
                    [
                        CurrencyRef => DIVE( $root, qw(CurrencyRef) ),
                        [ ListID   => DIVE( $root, qw(CurrencyRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(CurrencyRef FullName) ) ]
                    ]
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
