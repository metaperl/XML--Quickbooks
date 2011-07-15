package XML::Quickbooks::Writer;

use Moose;

extends 'XML::Quickbooks';

use Carp::Always;

sub as_xml {
    my ($self) = @_;

    my $xml = $self->xml->string->value;
    my $t   = XML::Twig->new(
        pretty_print  => 'indented',
        twig_handlers => {
            _all_ => sub { $_->delete() unless $_->text() },
            QBXMLMsgsRq => sub { $_->set_att( 'onError' => "stopOnError" ) }
        }
    );
    $t->parse($xml);

    $xml = sprintf "%s\n%s\n%s",
      '<?xml version="1.0" encoding="utf-8"?>',
      '<?qbxml version="10.0"?>',
      $t->sprint;

    #warn 'Setting Request...';

    $self->request($xml);

}

sub wrapping {
    my ($self) = @_;

    use Scalar::Util qw(blessed);

    my $class = blessed($self);
    if ( $class =~ /::(\w+)$/ ) {
        $class = $1;
    }
    else {
        die "$class did not match regexp";
    }

    my %wrapping = (
        AccountAdd      => [qw(AccountAddRq AccountAdd)],
        CustomerAdd     => [qw(CustomerAddRq CustomerAddRq)],
        EmployeeAdd     => [qw(EmployeeAddRq EmployeeAdd)],
        InvoiceAdd      => [qw(InvoiceAddRq InvoiceAdd)],
        ItemDiscountAdd => [qw(ItemDiscountAddRq ItemDiscountAdd)],
        ItemInventory   => [qw(ItemInventoryRq ItemInventory)],
        VendorAdd       => [qw(VendorAddRq VendorAdd)]
    );

    my $wrapping = $wrapping{$class} or die "No wrapping found for $class";
    $wrapping;
}

sub build_address {
    my ( $self, $row ) = @_;
    my %addr = (
        Addr1      => $row->{address1},
        Addr2      => $row->{address2},
        City       => $row->{city},
        State      => $row->{state},
        PostalCode => $row->{zip}
    );
    \%addr;
}

sub maybeFullName {
    my ( $self, $opt ) = @_;

    return unless $opt and my $f = $opt->{FullName} // undef;

    FullName($f);

}

=head1 NAME

  XML::Quickbooks::Writer - support for generating Quicbooks XML via XML::Tolol

=head1 SYNOPSIS

    ...

=method method_x

This method does something experimental.

=method method_y

This method returns a reason.

=head1 SEE ALSO

=for :list
* L<XML::Writer::Compiler>
* L<Moose>

=cut

1;
