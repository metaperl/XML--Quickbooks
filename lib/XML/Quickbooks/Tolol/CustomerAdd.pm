package XML::Quickbooks::Tolol::CustomerAdd;
use Moose;

extends qw(XML::Quickbooks::Tolol::VendorAdd);

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
                CustomerAddRq => DIVE( $root, qw() ),
                [
                    CustomerAdd => DIVE( $root, qw() ),
                    [ Name     => DIVE( $root, qw(Name) ) ],
                    [ IsActive => DIVE( $root, qw(IsActive) ) ],
                    [
                        ParentRef => DIVE( $root, qw(ParentRef) ),
                        [ ListID   => DIVE( $root, qw(ParentRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(ParentRef FullName) ) ]
                    ],
                    [ CompanyName => DIVE( $root, qw(CompanyName) ) ],
                    [ Salutation  => DIVE( $root, qw(Salutation) ) ],
                    [ FirstName   => DIVE( $root, qw(FirstName) ) ],
                    [ MiddleName  => DIVE( $root, qw(MiddleName) ) ],
                    [ LastName    => DIVE( $root, qw(LastName) ) ],
                    [
                        BillAddress => DIVE( $root, qw(BillAddress) ),
                        [ Addr1 => DIVE( $root, qw(BillAddress Addr1) ) ],
                        [ Addr2 => DIVE( $root, qw(BillAddress Addr2) ) ],
                        [ Addr3 => DIVE( $root, qw(BillAddress Addr3) ) ],
                        [ Addr4 => DIVE( $root, qw(BillAddress Addr4) ) ],
                        [ Addr5 => DIVE( $root, qw(BillAddress Addr5) ) ],
                        [ City  => DIVE( $root, qw(BillAddress City) ) ],
                        [ State => DIVE( $root, qw(BillAddress State) ) ],
                        [
                            PostalCode =>
                              DIVE( $root, qw(BillAddress PostalCode) )
                        ],
                        [ Country => DIVE( $root, qw(BillAddress Country) ) ],
                        [ Note    => DIVE( $root, qw(BillAddress Note) ) ]
                    ],
                    [
                        ShipAddress => DIVE( $root, qw(ShipAddress) ),
                        [ Addr1 => DIVE( $root, qw(ShipAddress Addr1) ) ],
                        [ Addr2 => DIVE( $root, qw(ShipAddress Addr2) ) ],
                        [ Addr3 => DIVE( $root, qw(ShipAddress Addr3) ) ],
                        [ Addr4 => DIVE( $root, qw(ShipAddress Addr4) ) ],
                        [ Addr5 => DIVE( $root, qw(ShipAddress Addr5) ) ],
                        [ City  => DIVE( $root, qw(ShipAddress City) ) ],
                        [ State => DIVE( $root, qw(ShipAddress State) ) ],
                        [
                            PostalCode =>
                              DIVE( $root, qw(ShipAddress PostalCode) )
                        ],
                        [ Country => DIVE( $root, qw(ShipAddress Country) ) ],
                        [ Note    => DIVE( $root, qw(ShipAddress Note) ) ]
                    ],
                    [ Phone      => DIVE( $root, qw(Phone) ) ],
                    [ AltPhone   => DIVE( $root, qw(AltPhone) ) ],
                    [ Fax        => DIVE( $root, qw(Fax) ) ],
                    [ Email      => DIVE( $root, qw(Email) ) ],
                    [ Contact    => DIVE( $root, qw(Contact) ) ],
                    [ AltContact => DIVE( $root, qw(AltContact) ) ],
                    [
                        CustomerTypeRef => DIVE( $root, qw(CustomerTypeRef) ),
                        [ ListID => DIVE( $root, qw(CustomerTypeRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(CustomerTypeRef FullName) )
                        ]
                    ],
                    [
                        TermsRef => DIVE( $root, qw(TermsRef) ),
                        [ ListID   => DIVE( $root, qw(TermsRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(TermsRef FullName) ) ]
                    ],
                    [
                        SalesRepRef => DIVE( $root, qw(SalesRepRef) ),
                        [ ListID   => DIVE( $root, qw(SalesRepRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(SalesRepRef FullName) ) ]
                    ],
                    [ OpenBalance     => DIVE( $root, qw(OpenBalance) ) ],
                    [ OpenBalanceDate => DIVE( $root, qw(OpenBalanceDate) ) ],
                    [
                        SalesTaxCodeRef => DIVE( $root, qw(SalesTaxCodeRef) ),
                        [ ListID => DIVE( $root, qw(SalesTaxCodeRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(SalesTaxCodeRef FullName) )
                        ]
                    ],
                    [
                        ItemSalesTaxRef => DIVE( $root, qw(ItemSalesTaxRef) ),
                        [ ListID => DIVE( $root, qw(ItemSalesTaxRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(ItemSalesTaxRef FullName) )
                        ]
                    ],
                    [ ResaleNumber  => DIVE( $root, qw(ResaleNumber) ) ],
                    [ AccountNumber => DIVE( $root, qw(AccountNumber) ) ],
                    [ CreditLimit   => DIVE( $root, qw(CreditLimit) ) ],
                    [
                        PreferredPaymentMethodRef =>
                          DIVE( $root, qw(PreferredPaymentMethodRef) ),
                        [
                            ListID => DIVE(
                                $root, qw(PreferredPaymentMethodRef ListID)
                            )
                        ],
                        [
                            FullName => DIVE(
                                $root, qw(PreferredPaymentMethodRef FullName)
                            )
                        ]
                    ],
                    [
                        CreditCardInfo => DIVE( $root, qw(CreditCardInfo) ),
                        [
                            CreditCardNumber => DIVE(
                                $root, qw(CreditCardInfo CreditCardNumber)
                            )
                        ],
                        [
                            ExpirationMonth =>
                              DIVE( $root, qw(CreditCardInfo ExpirationMonth) )
                        ],
                        [
                            ExpirationYear =>
                              DIVE( $root, qw(CreditCardInfo ExpirationYear) )
                        ],
                        [
                            NameOnCard =>
                              DIVE( $root, qw(CreditCardInfo NameOnCard) )
                        ],
                        [
                            CreditCardAddress => DIVE(
                                $root, qw(CreditCardInfo CreditCardAddress)
                            )
                        ],
                        [
                            CreditCardPostalCode => DIVE(
                                $root, qw(CreditCardInfo CreditCardPostalCode)
                            )
                        ]
                    ],
                    [ JobStatus    => DIVE( $root, qw(JobStatus) ) ],
                    [ JobStartDate => DIVE( $root, qw(JobStartDate) ) ],
                    [
                        JobProjectedEndDate =>
                          DIVE( $root, qw(JobProjectedEndDate) )
                    ],
                    [ JobEndDate => DIVE( $root, qw(JobEndDate) ) ],
                    [ JobDesc    => DIVE( $root, qw(JobDesc) ) ],
                    [
                        JobTypeRef => DIVE( $root, qw(JobTypeRef) ),
                        [ ListID   => DIVE( $root, qw(JobTypeRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(JobTypeRef FullName) ) ]
                    ],
                    [ Notes => DIVE( $root, qw(Notes) ) ],
                    [
                        PriceLevelRef => DIVE( $root, qw(PriceLevelRef) ),
                        [ ListID => DIVE( $root, qw(PriceLevelRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(PriceLevelRef FullName) )
                        ]
                    ],
                    [ ExternalGUID => DIVE( $root, qw(ExternalGUID) ) ],
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
