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

sub tagQBXML {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXML => @$attr );

    $self->tagQBXMLMsgsRq;
    $self->writer->endTag;
}

sub tagQBXMLMsgsRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( QBXMLMsgsRq => @$attr );

    $self->tagEmployeeAddRq;
    $self->writer->endTag;
}

sub tagEmployeeAddRq {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeAddRq => @$attr );

    $self->tagEmployeeAdd;
    $self->tagIncludeRetElement;
    $self->writer->endTag;
}

sub tagEmployeeAdd {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw() );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeAdd => @$attr );

    $self->tagIsActive;
    $self->tagSalutation;
    $self->tagFirstName;
    $self->tagMiddleName;
    $self->tagLastName;
    $self->tagEmployeeAddress;
    $self->tagPrintAs;
    $self->tagPhone;
    $self->tagMobile;
    $self->tagPager;
    $self->tagPagerPIN;
    $self->tagAltPhone;
    $self->tagFax;
    $self->tagSSN;
    $self->tagEmail;
    $self->tagEmployeeType;
    $self->tagGender;
    $self->tagHiredDate;
    $self->tagReleasedDate;
    $self->tagBirthDate;
    $self->tagAccountNumber;
    $self->tagNotes;
    $self->tagBillingRateRef;
    $self->tagEmployeePayrollInfo;
    $self->tagExternalGUID;
    $self->writer->endTag;
}

sub tagIsActive {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(IsActive) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsActive => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSalutation {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Salutation) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Salutation => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFirstName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(FirstName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FirstName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMiddleName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(MiddleName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MiddleName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagLastName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(LastName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( LastName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEmployeeAddress {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeAddress => @$attr );

    $self->tagAddr1;
    $self->tagAddr2;
    $self->tagCity;
    $self->tagState;
    $self->tagPostalCode;
    $self->writer->endTag;
}

sub tagAddr1 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress Addr1) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr1 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAddr2 {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress Addr2) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Addr2 => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagCity {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress City) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( City => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagState {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress State) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( State => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPostalCode {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeAddress PostalCode) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PostalCode => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPrintAs {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PrintAs) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PrintAs => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Phone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Phone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMobile {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Mobile) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Mobile => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPager {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Pager) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Pager => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagPagerPIN {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(PagerPIN) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PagerPIN => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAltPhone {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AltPhone) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AltPhone => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFax {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Fax) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Fax => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSSN {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(SSN) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SSN => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEmail {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Email) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Email => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEmployeeType {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeeType) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeeType => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagGender {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Gender) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Gender => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagHiredDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(HiredDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HiredDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagReleasedDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ReleasedDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ReleasedDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagBirthDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BirthDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BirthDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccountNumber {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(AccountNumber) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccountNumber => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagNotes {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(Notes) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Notes => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagBillingRateRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( BillingRateRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(BillingRateRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEmployeePayrollInfo {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( EmployeePayrollInfo => @$attr );

    $self->tagPayPeriod;
    $self->tagClassRef;
    $self->tagClearEarnings;
    $self->tagEarnings;
    $self->tagIsUsingTimeDataToCreatePaychecks;
    $self->tagUseTimeDataToCreatePaychecks;
    $self->tagSickHours;
    $self->tagVacationHours;
    $self->writer->endTag;
}

sub tagPayPeriod {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo PayPeriod) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PayPeriod => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagClassRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo ClassRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ClassRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo ClassRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo ClassRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagClearEarnings {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo ClearEarnings) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ClearEarnings => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagEarnings {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo Earnings) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Earnings => @$attr );

    $self->tagPayrollItemWageRef;
    $self->tagRate;
    $self->tagRatePercent;
    $self->writer->endTag;
}

sub tagPayrollItemWageRef {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo Earnings PayrollItemWageRef) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( PayrollItemWageRef => @$attr );

    $self->tagListID;
    $self->tagFullName;
    $self->writer->endTag;
}

sub tagListID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo Earnings PayrollItemWageRef ListID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ListID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagFullName {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo Earnings PayrollItemWageRef FullName) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( FullName => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagRate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo Earnings Rate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( Rate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagRatePercent {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo Earnings RatePercent) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( RatePercent => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsUsingTimeDataToCreatePaychecks {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo IsUsingTimeDataToCreatePaychecks) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsUsingTimeDataToCreatePaychecks => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagUseTimeDataToCreatePaychecks {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo UseTimeDataToCreatePaychecks) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( UseTimeDataToCreatePaychecks => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagSickHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(EmployeePayrollInfo SickHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( SickHours => @$attr );

    $self->tagHoursAvailable;
    $self->tagAccrualPeriod;
    $self->tagHoursAccrued;
    $self->tagMaximumHours;
    $self->tagIsResettingHoursEachNewYear;
    $self->tagHoursUsed;
    $self->tagAccrualStartDate;
    $self->writer->endTag;
}

sub tagHoursAvailable {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours HoursAvailable) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAvailable => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccrualPeriod {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours AccrualPeriod) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualPeriod => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagHoursAccrued {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours HoursAccrued) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAccrued => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMaximumHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours MaximumHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MaximumHours => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsResettingHoursEachNewYear {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo SickHours IsResettingHoursEachNewYear) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsResettingHoursEachNewYear => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagHoursUsed {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours HoursUsed) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursUsed => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccrualStartDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo SickHours AccrualStartDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualStartDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagVacationHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( VacationHours => @$attr );

    $self->tagHoursAvailable;
    $self->tagAccrualPeriod;
    $self->tagHoursAccrued;
    $self->tagMaximumHours;
    $self->tagIsResettingHoursEachNewYear;
    $self->tagHoursUsed;
    $self->tagAccrualStartDate;
    $self->writer->endTag;
}

sub tagHoursAvailable {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo VacationHours HoursAvailable) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAvailable => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccrualPeriod {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours AccrualPeriod) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualPeriod => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagHoursAccrued {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours HoursAccrued) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursAccrued => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagMaximumHours {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours MaximumHours) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( MaximumHours => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIsResettingHoursEachNewYear {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo VacationHours IsResettingHoursEachNewYear) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( IsResettingHoursEachNewYear => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagHoursUsed {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata =
      $self->DIVE( $root, qw(EmployeePayrollInfo VacationHours HoursUsed) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( HoursUsed => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagAccrualStartDate {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root,
        qw(EmployeePayrollInfo VacationHours AccrualStartDate) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( AccrualStartDate => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagExternalGUID {
    my ($self) = @_;

    my $root = $self->data;

    my $elementdata = $self->DIVE( $root, qw(ExternalGUID) );

    my ( $attr, $data ) = $self->EXTRACT($elementdata);
    $self->writer->startTag( ExternalGUID => @$attr );

    $self->writer->characters($data);
    $self->writer->endTag;
}

sub tagIncludeRetElement {
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
    my $method = 'tagQBXML';
    $self->$method;
    $self->writer->end;
    $self;
}

1;
