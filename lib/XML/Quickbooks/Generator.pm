package XML::Quickbooks::Generator;


use Moose;

extends 'XML::Quickbooks';

use Carp;
use XML::Generator ':pretty';

sub as_xml {
     my ($self) = @_;

     my $x =
	  QBXML(
		QBXMLMsgsRq( {onError => "stopOnError"},
			     inner()
			     ));

     $self->request('<?xml version="1.0" encoding="utf-8"?> <?qbxml version="10.0"?>' . $x);
}

=head1 NAME

  XML::Quickbooks::Generator - support for generating Quicbooks XML via XML::Generator

=head1 SYNOPSIS

    ...

=method method_x

This method does something experimental.

=method method_y

This method returns a reason.

=head1 SEE ALSO

=for :list
* L<XML::Generator>
* L<Moose>

=cut
1;
