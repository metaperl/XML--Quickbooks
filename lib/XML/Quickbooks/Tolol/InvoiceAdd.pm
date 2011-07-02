package XML::Quickbooks::Tolol::InvoiceAdd;
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
                InvoiceAddRq => DIVE( $root, qw() ),
                [
                    InvoiceAdd => { 'defMacro' => 'MACROTYPE' } =>
                      DIVE( $root, qw() ),
                    [
                        CustomerRef => DIVE( $root, qw(CustomerRef) ),
                        [ ListID   => DIVE( $root, qw(CustomerRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(CustomerRef FullName) ) ]
                    ],
                    [
                        ClassRef => DIVE( $root, qw(ClassRef) ),
                        [ ListID   => DIVE( $root, qw(ClassRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(ClassRef FullName) ) ]
                    ],
                    [
                        ARAccountRef => DIVE( $root, qw(ARAccountRef) ),
                        [ ListID => DIVE( $root, qw(ARAccountRef ListID) ) ],
                        [
                            FullName => DIVE( $root, qw(ARAccountRef FullName) )
                        ]
                    ],
                    [
                        TemplateRef => DIVE( $root, qw(TemplateRef) ),
                        [ ListID   => DIVE( $root, qw(TemplateRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(TemplateRef FullName) ) ]
                    ],
                    [ TxnDate   => DIVE( $root, qw(TxnDate) ) ],
                    [ RefNumber => DIVE( $root, qw(RefNumber) ) ],
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
                    [ IsPending       => DIVE( $root, qw(IsPending) ) ],
                    [ IsFinanceCharge => DIVE( $root, qw(IsFinanceCharge) ) ],
                    [ PONumber        => DIVE( $root, qw(PONumber) ) ],
                    [
                        TermsRef => DIVE( $root, qw(TermsRef) ),
                        [ ListID   => DIVE( $root, qw(TermsRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(TermsRef FullName) ) ]
                    ],
                    [ DueDate => DIVE( $root, qw(DueDate) ) ],
                    [
                        SalesRepRef => DIVE( $root, qw(SalesRepRef) ),
                        [ ListID   => DIVE( $root, qw(SalesRepRef ListID) ) ],
                        [ FullName => DIVE( $root, qw(SalesRepRef FullName) ) ]
                    ],
                    [ FOB      => DIVE( $root, qw(FOB) ) ],
                    [ ShipDate => DIVE( $root, qw(ShipDate) ) ],
                    [
                        ShipMethodRef => DIVE( $root, qw(ShipMethodRef) ),
                        [ ListID => DIVE( $root, qw(ShipMethodRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(ShipMethodRef FullName) )
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
                    [ Memo => DIVE( $root, qw(Memo) ) ],
                    [
                        CustomerMsgRef => DIVE( $root, qw(CustomerMsgRef) ),
                        [ ListID => DIVE( $root, qw(CustomerMsgRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(CustomerMsgRef FullName) )
                        ]
                    ],
                    [ IsToBePrinted => DIVE( $root, qw(IsToBePrinted) ) ],
                    [ IsToBeEmailed => DIVE( $root, qw(IsToBeEmailed) ) ],
                    [
                        CustomerSalesTaxCodeRef =>
                          DIVE( $root, qw(CustomerSalesTaxCodeRef) ),
                        [
                            ListID =>
                              DIVE( $root, qw(CustomerSalesTaxCodeRef ListID) )
                        ],
                        [
                            FullName => DIVE(
                                $root, qw(CustomerSalesTaxCodeRef FullName)
                            )
                        ]
                    ],
                    [ Other        => DIVE( $root, qw(Other) ) ],
                    [ ExchangeRate => DIVE( $root, qw(ExchangeRate) ) ],
                    [ ExternalGUID => DIVE( $root, qw(ExternalGUID) ) ],
                    [ LinkToTxnID  => DIVE( $root, qw(LinkToTxnID) ) ],
                    [
                        SetCredit => DIVE( $root, qw(SetCredit) ),
                        [
                            CreditTxnID => { 'useMacro' => 'MACROTYPE' } =>
                              DIVE( $root, qw(SetCredit CreditTxnID) )
                        ],
                        [
                            AppliedAmount =>
                              DIVE( $root, qw(SetCredit AppliedAmount) )
                        ],
                        [ Override => DIVE( $root, qw(SetCredit Override) ) ]
                    ],
                    [
                        InvoiceLineAdd => { 'defMacro' => 'MACROTYPE' } =>
                          DIVE( $root, qw(InvoiceLineAdd) ),
                        [
                            ItemRef =>
                              DIVE( $root, qw(InvoiceLineAdd ItemRef) ),
                            [
                                ListID => DIVE(
                                    $root, qw(InvoiceLineAdd ItemRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root, qw(InvoiceLineAdd ItemRef FullName)
                                )
                            ]
                        ],
                        [ Desc => DIVE( $root, qw(InvoiceLineAdd Desc) ) ],
                        [
                            Quantity =>
                              DIVE( $root, qw(InvoiceLineAdd Quantity) )
                        ],
                        [
                            UnitOfMeasure =>
                              DIVE( $root, qw(InvoiceLineAdd UnitOfMeasure) )
                        ],
                        [ Rate => DIVE( $root, qw(InvoiceLineAdd Rate) ) ],
                        [
                            RatePercent =>
                              DIVE( $root, qw(InvoiceLineAdd RatePercent) )
                        ],
                        [
                            PriceLevelRef =>
                              DIVE( $root, qw(InvoiceLineAdd PriceLevelRef) ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd PriceLevelRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd PriceLevelRef FullName)
                                )
                            ]
                        ],
                        [
                            ClassRef =>
                              DIVE( $root, qw(InvoiceLineAdd ClassRef) ),
                            [
                                ListID => DIVE(
                                    $root, qw(InvoiceLineAdd ClassRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root, qw(InvoiceLineAdd ClassRef FullName)
                                )
                            ]
                        ],
                        [ Amount => DIVE( $root, qw(InvoiceLineAdd Amount) ) ],
                        [
                            InventorySiteRef => DIVE(
                                $root, qw(InvoiceLineAdd InventorySiteRef)
                            ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd InventorySiteRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd InventorySiteRef FullName)
                                )
                            ]
                        ],
                        [
                            ServiceDate =>
                              DIVE( $root, qw(InvoiceLineAdd ServiceDate) )
                        ],
                        [
                            SalesTaxCodeRef =>
                              DIVE( $root, qw(InvoiceLineAdd SalesTaxCodeRef) ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd SalesTaxCodeRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd SalesTaxCodeRef FullName)
                                )
                            ]
                        ],
                        [
                            OverrideItemAccountRef => DIVE(
                                $root, qw(InvoiceLineAdd OverrideItemAccountRef)
                            ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd OverrideItemAccountRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd OverrideItemAccountRef FullName)
                                )
                            ]
                        ],
                        [ Other1 => DIVE( $root, qw(InvoiceLineAdd Other1) ) ],
                        [ Other2 => DIVE( $root, qw(InvoiceLineAdd Other2) ) ],
                        [
                            LinkToTxn =>
                              DIVE( $root, qw(InvoiceLineAdd LinkToTxn) ),
                            [
                                TxnID => DIVE(
                                    $root, qw(InvoiceLineAdd LinkToTxn TxnID)
                                )
                            ],
                            [
                                TxnLineID => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd LinkToTxn TxnLineID)
                                )
                            ]
                        ],
                        [
                            DataExt =>
                              DIVE( $root, qw(InvoiceLineAdd DataExt) ),
                            [
                                OwnerID => DIVE(
                                    $root, qw(InvoiceLineAdd DataExt OwnerID)
                                )
                            ],
                            [
                                DataExtName => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd DataExt DataExtName)
                                )
                            ],
                            [
                                DataExtValue => DIVE(
                                    $root,
                                    qw(InvoiceLineAdd DataExt DataExtValue)
                                )
                            ]
                        ]
                    ],
                    [
                        InvoiceLineGroupAdd =>
                          DIVE( $root, qw(InvoiceLineGroupAdd) ),
                        [
                            ItemGroupRef => DIVE(
                                $root, qw(InvoiceLineGroupAdd ItemGroupRef)
                            ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd ItemGroupRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd ItemGroupRef FullName)
                                )
                            ]
                        ],
                        [
                            Quantity =>
                              DIVE( $root, qw(InvoiceLineGroupAdd Quantity) )
                        ],
                        [
                            UnitOfMeasure => DIVE(
                                $root, qw(InvoiceLineGroupAdd UnitOfMeasure)
                            )
                        ],
                        [
                            InventorySiteRef => DIVE(
                                $root, qw(InvoiceLineGroupAdd InventorySiteRef)
                            ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd InventorySiteRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd InventorySiteRef FullName)
                                )
                            ]
                        ],
                        [
                            DataExt =>
                              DIVE( $root, qw(InvoiceLineGroupAdd DataExt) ),
                            [
                                OwnerID => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd DataExt OwnerID)
                                )
                            ],
                            [
                                DataExtName => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd DataExt DataExtName)
                                )
                            ],
                            [
                                DataExtValue => DIVE(
                                    $root,
                                    qw(InvoiceLineGroupAdd DataExt DataExtValue)
                                )
                            ]
                        ]
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
