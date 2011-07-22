package XML::Quickbooks::Writer::EmployeeAdd;
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

    $self->_tag_EmployeeAddRq;
    $self->writer->endTag;
}

sub _tag_EmployeeAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeAddRq => @$attr );

    $self->_tag_EmployeeAdd;
    $self->_tag_IncludeRetElement;
    $self->writer->endTag;
}

sub _tag_EmployeeAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeAdd => @$attr );

    $self->_tag_IsActive;
    $self->_tag_Salutation;
    $self->_tag_FirstName;
    $self->_tag_MiddleName;
    $self->_tag_LastName;
    $self->_tag_EmployeeAddress;
    $self->_tag_PrintAs;
    $self->_tag_Phone;
    $self->_tag_Mobile;
    $self->_tag_Pager;
    $self->_tag_PagerPIN;
    $self->_tag_AltPhone;
    $self->_tag_Fax;
    $self->_tag_SSN;
    $self->_tag_Email;
    $self->_tag_EmployeeType;
    $self->_tag_Gender;
    $self->_tag_HiredDate;
    $self->_tag_ReleasedDate;
    $self->_tag_BirthDate;
    $self->_tag_AccountNumber;
    $self->_tag_Notes;
    $self->_tag_BillingRateRef;
    $self->_tag_EmployeePayrollInfo;
    $self->_tag_ExternalGUID;
    $self->writer->endTag;
}

sub _tag_IsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Salutation {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Salutation) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Salutation => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_FirstName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FirstName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FirstName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_MiddleName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(MiddleName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MiddleName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_LastName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(LastName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LastName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeeAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeAddress => @$attr );

    $self->_tag_EmployeeAddress_Addr1;
    $self->_tag_EmployeeAddress_Addr2;
    $self->_tag_EmployeeAddress_City;
    $self->_tag_EmployeeAddress_State;
    $self->_tag_EmployeeAddress_PostalCode;
    $self->writer->endTag;
}

sub _tag_EmployeeAddress_Addr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeeAddress_Addr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeeAddress_City {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeeAddress_State {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeeAddress_PostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PrintAs {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrintAs) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PrintAs => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Phone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Phone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Phone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Mobile {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Mobile) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Mobile => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Pager {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Pager) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Pager => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_PagerPIN {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PagerPIN) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PagerPIN => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AltPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AltPhone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltPhone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Fax {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Fax) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Fax => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_SSN {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SSN) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SSN => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Email {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Email) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Email => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeeType {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeType) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeType => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Gender {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Gender) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Gender => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_HiredDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(HiredDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HiredDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ReleasedDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ReleasedDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ReleasedDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BirthDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BirthDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BirthDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_AccountNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_Notes {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Notes) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Notes => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillingRateRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BillingRateRef => @$attr );

    $self->_tag_BillingRateRef_ListID;
    $self->_tag_BillingRateRef_FullName;
    $self->writer->endTag;
}

sub _tag_BillingRateRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_BillingRateRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeePayrollInfo => @$attr );

    $self->_tag_EmployeePayrollInfo_PayPeriod;
    $self->_tag_EmployeePayrollInfo_ClassRef;
    $self->_tag_EmployeePayrollInfo_ClearEarnings;
    $self->_tag_EmployeePayrollInfo_Earnings;
    $self->_tag_EmployeePayrollInfo_IsUsingTimeDataToCreatePaychecks;
    $self->_tag_EmployeePayrollInfo_UseTimeDataToCreatePaychecks;
    $self->_tag_EmployeePayrollInfo_SickHours;
    $self->_tag_EmployeePayrollInfo_VacationHours;
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_PayPeriod {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo PayPeriod) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PayPeriod => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_ClassRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo ClassRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ClassRef => @$attr );

    $self->_tag_EmployeePayrollInfo_ClassRef_ListID;
    $self->_tag_EmployeePayrollInfo_ClassRef_FullName;
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_ClassRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo ClassRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_ClassRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo ClassRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_ClearEarnings {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo ClearEarnings) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ClearEarnings => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_Earnings {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo Earnings) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Earnings => @$attr );

    $self->_tag_EmployeePayrollInfo_Earnings_PayrollItemWageRef;
    $self->_tag_EmployeePayrollInfo_Earnings_Rate;
    $self->_tag_EmployeePayrollInfo_Earnings_RatePercent;
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_Earnings_PayrollItemWageRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo Earnings PayrollItemWageRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PayrollItemWageRef => @$attr );

    $self->_tag_EmployeePayrollInfo_Earnings_PayrollItemWageRef_ListID;
    $self->_tag_EmployeePayrollInfo_Earnings_PayrollItemWageRef_FullName;
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_Earnings_PayrollItemWageRef_ListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo Earnings PayrollItemWageRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_Earnings_PayrollItemWageRef_FullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo Earnings PayrollItemWageRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_Earnings_Rate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo Earnings Rate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Rate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_Earnings_RatePercent {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo Earnings RatePercent) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( RatePercent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_IsUsingTimeDataToCreatePaychecks {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo IsUsingTimeDataToCreatePaychecks) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsUsingTimeDataToCreatePaychecks => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_UseTimeDataToCreatePaychecks {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo UseTimeDataToCreatePaychecks) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( UseTimeDataToCreatePaychecks => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo SickHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SickHours => @$attr );

    $self->_tag_EmployeePayrollInfo_SickHours_HoursAvailable;
    $self->_tag_EmployeePayrollInfo_SickHours_AccrualPeriod;
    $self->_tag_EmployeePayrollInfo_SickHours_HoursAccrued;
    $self->_tag_EmployeePayrollInfo_SickHours_MaximumHours;
    $self->_tag_EmployeePayrollInfo_SickHours_IsResettingHoursEachNewYear;
    $self->_tag_EmployeePayrollInfo_SickHours_HoursUsed;
    $self->_tag_EmployeePayrollInfo_SickHours_AccrualStartDate;
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_HoursAvailable {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours HoursAvailable) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAvailable => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_AccrualPeriod {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours AccrualPeriod) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualPeriod => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_HoursAccrued {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours HoursAccrued) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAccrued => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_MaximumHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours MaximumHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MaximumHours => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_IsResettingHoursEachNewYear {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo SickHours IsResettingHoursEachNewYear) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsResettingHoursEachNewYear => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_HoursUsed {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours HoursUsed) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursUsed => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_SickHours_AccrualStartDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours AccrualStartDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualStartDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VacationHours => @$attr );

    $self->_tag_EmployeePayrollInfo_VacationHours_HoursAvailable;
    $self->_tag_EmployeePayrollInfo_VacationHours_AccrualPeriod;
    $self->_tag_EmployeePayrollInfo_VacationHours_HoursAccrued;
    $self->_tag_EmployeePayrollInfo_VacationHours_MaximumHours;
    $self->_tag_EmployeePayrollInfo_VacationHours_IsResettingHoursEachNewYear;
    $self->_tag_EmployeePayrollInfo_VacationHours_HoursUsed;
    $self->_tag_EmployeePayrollInfo_VacationHours_AccrualStartDate;
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_HoursAvailable {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo VacationHours HoursAvailable) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAvailable => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_AccrualPeriod {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours AccrualPeriod) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualPeriod => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_HoursAccrued {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours HoursAccrued) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAccrued => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_MaximumHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours MaximumHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MaximumHours => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_IsResettingHoursEachNewYear {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo VacationHours IsResettingHoursEachNewYear) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsResettingHoursEachNewYear => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_HoursUsed {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours HoursUsed) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursUsed => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_EmployeePayrollInfo_VacationHours_AccrualStartDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo VacationHours AccrualStartDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualStartDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub _tag_ExternalGUID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ExternalGUID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExternalGUID => @$attr );

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

sub xml {
    my ($self) = @_;
    my $method = '_tag_QBXML';
    $self->$method;
    $self->writer->end;
    $self;
}

1;
