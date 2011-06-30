package XML::Quickbooks::Tolol::EmployeeAdd;
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
                EmployeeAddRq => DIVE( $root, qw() ),
                [
                    EmployeeAdd => DIVE( $root, qw() ),
                    [ IsActive   => DIVE( $root, qw(IsActive) ) ],
                    [ Salutation => DIVE( $root, qw(Salutation) ) ],
                    [ FirstName  => DIVE( $root, qw(FirstName) ) ],
                    [ MiddleName => DIVE( $root, qw(MiddleName) ) ],
                    [ LastName   => DIVE( $root, qw(LastName) ) ],
                    [
                        EmployeeAddress => DIVE( $root, qw(EmployeeAddress) ),
                        [ Addr1 => DIVE( $root, qw(EmployeeAddress Addr1) ) ],
                        [ Addr2 => DIVE( $root, qw(EmployeeAddress Addr2) ) ],
                        [ City  => DIVE( $root, qw(EmployeeAddress City) ) ],
                        [ State => DIVE( $root, qw(EmployeeAddress State) ) ],
                        [
                            PostalCode =>
                              DIVE( $root, qw(EmployeeAddress PostalCode) )
                        ]
                    ],
                    [ PrintAs       => DIVE( $root, qw(PrintAs) ) ],
                    [ Phone         => DIVE( $root, qw(Phone) ) ],
                    [ Mobile        => DIVE( $root, qw(Mobile) ) ],
                    [ Pager         => DIVE( $root, qw(Pager) ) ],
                    [ PagerPIN      => DIVE( $root, qw(PagerPIN) ) ],
                    [ AltPhone      => DIVE( $root, qw(AltPhone) ) ],
                    [ Fax           => DIVE( $root, qw(Fax) ) ],
                    [ SSN           => DIVE( $root, qw(SSN) ) ],
                    [ Email         => DIVE( $root, qw(Email) ) ],
                    [ EmployeeType  => DIVE( $root, qw(EmployeeType) ) ],
                    [ Gender        => DIVE( $root, qw(Gender) ) ],
                    [ HiredDate     => DIVE( $root, qw(HiredDate) ) ],
                    [ ReleasedDate  => DIVE( $root, qw(ReleasedDate) ) ],
                    [ BirthDate     => DIVE( $root, qw(BirthDate) ) ],
                    [ AccountNumber => DIVE( $root, qw(AccountNumber) ) ],
                    [ Notes         => DIVE( $root, qw(Notes) ) ],
                    [
                        BillingRateRef => DIVE( $root, qw(BillingRateRef) ),
                        [ ListID => DIVE( $root, qw(BillingRateRef ListID) ) ],
                        [
                            FullName =>
                              DIVE( $root, qw(BillingRateRef FullName) )
                        ]
                    ],
                    [
                        EmployeePayrollInfo =>
                          DIVE( $root, qw(EmployeePayrollInfo) ),
                        [
                            PayPeriod =>
                              DIVE( $root, qw(EmployeePayrollInfo PayPeriod) )
                        ],
                        [
                            ClassRef =>
                              DIVE( $root, qw(EmployeePayrollInfo ClassRef) ),
                            [
                                ListID => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo ClassRef ListID)
                                )
                            ],
                            [
                                FullName => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo ClassRef FullName)
                                )
                            ]
                        ],
                        [
                            ClearEarnings => DIVE(
                                $root, qw(EmployeePayrollInfo ClearEarnings)
                            )
                        ],
                        [
                            Earnings =>
                              DIVE( $root, qw(EmployeePayrollInfo Earnings) ),
                            [
                                PayrollItemWageRef => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo Earnings PayrollItemWageRef)
                                ),
                                [
                                    ListID => DIVE(
                                        $root,
                                        qw(EmployeePayrollInfo Earnings PayrollItemWageRef ListID)
                                    )
                                ],
                                [
                                    FullName => DIVE(
                                        $root,
                                        qw(EmployeePayrollInfo Earnings PayrollItemWageRef FullName)
                                    )
                                ]
                            ],
                            [
                                Rate => DIVE(
                                    $root, qw(EmployeePayrollInfo Earnings Rate)
                                )
                            ],
                            [
                                RatePercent => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo Earnings RatePercent)
                                )
                            ]
                        ],
                        [
                            IsUsingTimeDataToCreatePaychecks => DIVE(
                                $root,
                                qw(EmployeePayrollInfo IsUsingTimeDataToCreatePaychecks)
                            )
                        ],
                        [
                            UseTimeDataToCreatePaychecks => DIVE(
                                $root,
                                qw(EmployeePayrollInfo UseTimeDataToCreatePaychecks)
                            )
                        ],
                        [
                            SickHours =>
                              DIVE( $root, qw(EmployeePayrollInfo SickHours) ),
                            [
                                HoursAvailable => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours HoursAvailable)
                                )
                            ],
                            [
                                AccrualPeriod => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours AccrualPeriod)
                                )
                            ],
                            [
                                HoursAccrued => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours HoursAccrued)
                                )
                            ],
                            [
                                MaximumHours => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours MaximumHours)
                                )
                            ],
                            [
                                IsResettingHoursEachNewYear => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours IsResettingHoursEachNewYear)
                                )
                            ],
                            [
                                HoursUsed => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours HoursUsed)
                                )
                            ],
                            [
                                AccrualStartDate => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo SickHours AccrualStartDate)
                                )
                            ]
                        ],
                        [
                            VacationHours => DIVE(
                                $root, qw(EmployeePayrollInfo VacationHours)
                            ),
                            [
                                HoursAvailable => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours HoursAvailable)
                                )
                            ],
                            [
                                AccrualPeriod => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours AccrualPeriod)
                                )
                            ],
                            [
                                HoursAccrued => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours HoursAccrued)
                                )
                            ],
                            [
                                MaximumHours => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours MaximumHours)
                                )
                            ],
                            [
                                IsResettingHoursEachNewYear => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours IsResettingHoursEachNewYear)
                                )
                            ],
                            [
                                HoursUsed => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours HoursUsed)
                                )
                            ],
                            [
                                AccrualStartDate => DIVE(
                                    $root,
                                    qw(EmployeePayrollInfo VacationHours AccrualStartDate)
                                )
                            ]
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
