package XML::Quickbooks::Tolol::VendorAdd;
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
                VendorAddRq => DIVE( $root, qw() ),
                [
                    VendorAdd => DIVE( $root, qw() ),
                    [ Name        => DIVE( $root, qw(Name) ) ],
                    [ IsActive    => DIVE( $root, qw(IsActive) ) ],
                    [ CompanyName => DIVE( $root, qw(CompanyName) ) ],
                    [ Salutation  => DIVE( $root, qw(Salutation) ) ],
                    [ FirstName   => DIVE( $root, qw(FirstName) ) ],
                    [ MiddleName  => DIVE( $root, qw(MiddleName) ) ],
                    [ LastName    => DIVE( $root, qw(LastName) ) ],
                    [
                        VendorAddress => DIVE( $root, qw(VendorAddress) ),
                        [ Addr1 => DIVE( $root, qw(VendorAddress Addr1) ) ],
                        [ Addr2 => DIVE( $root, qw(VendorAddress Addr2) ) ],
                        [ Addr3 => DIVE( $root, qw(VendorAddress Addr3) ) ],
                        [ Addr4 => DIVE( $root, qw(VendorAddress Addr4) ) ],
                        [ Addr5 => DIVE( $root, qw(VendorAddress Addr5) ) ],
                        [ City  => DIVE( $root, qw(VendorAddress City) ) ],
                        [ State => DIVE( $root, qw(VendorAddress State) ) ],
                        [
                            PostalCode =>
                              DIVE( $root, qw(VendorAddress PostalCode) )
                        ],
                        [ Country => DIVE( $root, qw(VendorAddress Country) ) ],
                        [ Note    => DIVE( $root, qw(VendorAddress Note) ) ]
                    ],
                    [ Phone         => DIVE( $root, qw(Phone) ) ],
                    [ AltPhone      => DIVE( $root, qw(AltPhone) ) ],
                    [ Fax           => DIVE( $root, qw(Fax) ) ],
                    [ Email         => DIVE( $root, qw(Email) ) ],
                    [ Contact       => DIVE( $root, qw(Contact) ) ],
                    [ AltContact    => DIVE( $root, qw(AltContact) ) ],
                    [ NameOnCheck   => DIVE( $root, qw(NameOnCheck) ) ],
                    [ AccountNumber => DIVE( $root, qw(AccountNumber) ) ],
                    [ Notes         => DIVE( $root, qw(Notes) ) ],
                    [
                        VendorTypeRef => DIVE( $root, qw(VendorTypeRef) ),
                        [ ListID => DIVE( $root, qw(VendorTypeRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(VendorTypeRef FullName) )
                        ]
                    ],
                    [
                        TermsRef => DIVE( $root, qw(TermsRef) ),
                        [ ListID   => DIVE( $root, qw(TermsRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(TermsRef FullName) ) ]
                    ],
                    [ CreditLimit    => DIVE( $root, qw(CreditLimit) ) ],
                    [ VendorTaxIdent => DIVE( $root, qw(VendorTaxIdent) ) ],
                    [
                        IsVendorEligibleFor1099 =>
                          DIVE( $root, qw(IsVendorEligibleFor1099) )
                    ],
                    [ OpenBalance     => DIVE( $root, qw(OpenBalance) ) ],
                    [ OpenBalanceDate => DIVE( $root, qw(OpenBalanceDate) ) ],
                    [
                        BillingRateRef => DIVE( $root, qw(BillingRateRef) ),
                        [ ListID => DIVE( $root, qw(BillingRateRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(BillingRateRef FullName) )
                        ]
                    ],
                    [ ExternalGUID => DIVE( $root, qw(ExternalGUID) ) ],
                    [
                        PrefillAccountRef =>
                          DIVE( $root, qw(PrefillAccountRef) ),
                        [
                            ListID =>
                              DIVE( $root, qw(PrefillAccountRef ListID) )
                        ],
                        [
                            FullName =>
                              DIVE( $root, qw(PrefillAccountRef FullName) )
                        ]
                    ],
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
