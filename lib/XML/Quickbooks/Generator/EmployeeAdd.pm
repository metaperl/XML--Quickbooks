package XML::Quickbooks::Generator::EmployeeAdd;

use Moose;

extends 'XML::Quickbooks::Generator';
with    'XML::Quickbooks::Generator::AddressData';
with    'XML::Quickbooks::Util';

use XML::Generator ':pretty';

use Lingua::EN::NameParse qw(clean case_surname);

 my %args =
    (
        auto_clean      => 1,
        force_case      => 1,
        lc_prefix       => 1,
        initials        => 3,
        allow_reversed  => 1,
        joint_names     => 0,
        extended_titles => 0
    );

augment 'as_xml' => sub {
  my ($self, $row)=@_;


  my $name = Lingua::EN::NameParse->new(%args);
  $name->parse($row->{userfullname});
  my %c = $name->case_components;

  EmployeeAddRq(
		EmployeeAdd(
			    FirstName($self->trunc(25, $c{given_name_1})),
			    MiddleName($self->trunc(5, $c{middle_name})),
			    LastName($self->trunc(25, $c{surname_1}))
			    )
	       )
}  ;


1;
