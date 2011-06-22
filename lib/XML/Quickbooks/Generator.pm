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

     my $tree = XML::TreeBuilder->new({ 'NoExpand' => 0, 'ErrorContext' => 0 });
     $tree->parse($x);
     my @elem = $tree->look_down('_tag' => qr/.+/);
     for my $elem (@elem) {
	 $elem->delete if $elem->is_empty();
     }

     my $xml = sprintf "%s\n%s\n%s",
     '<?xml version="1.0" encoding="utf-8"?>',
     '<?qbxml version="10.0"?>',
     $tree->as_XML(undef, '  ');

     $tree->delete;

     warn 'Setting Request...';

     $self->request($xml);
     Carp::cluck( "Setting Request...DONE($self->{warnrequest}): $xml");

}

sub maybeFullName {
  my($self,$opt)=@_;

  return unless $opt and my $f = $opt->{FullName} // undef ;

  FullName($f);

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
