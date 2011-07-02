package XML::Quickbooks::Tolol;


use Moose;

extends 'XML::Quickbooks';

use Carp::Always;
use HTML::Element::Prune;

sub as_xml {
     my ($self) = @_;

     my $tree = $self->tree->prune;

     my $xml = sprintf "%s\n%s\n%s",
       '<?xml version="1.0" encoding="utf-8"?>',
	 '<?qbxml version="10.0"?>',
	   $tree->as_XML;

     $tree->delete;

     #warn 'Setting Request...';

     $self->request($self->pretty_print($xml));
     #Carp::cluck( "Setting Request...DONE($self->{warnrequest}): $xml");

}


sub maybeFullName {
  my($self,$opt)=@_;

  return unless $opt and my $f = $opt->{FullName} // undef ;

  FullName($f);

}


=head1 NAME

  XML::Quickbooks::Tolol - support for generating Quicbooks XML via XML::Tolol

=head1 SYNOPSIS

    ...

=method method_x

This method does something experimental.

=method method_y

This method returns a reason.

=head1 SEE ALSO

=for :list
* L<XML::Tolol>
* L<Moose>

=cut
1;
