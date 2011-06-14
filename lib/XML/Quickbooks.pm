package XML::Quickbooks;
# ABSTRACT: XML::Toolkit classes for manipulating Quickbooks

use Moose;

has 'request' => (is => 'rw');
has 'response' => (is => 'rw');
has 'responsetree' => (is => 'rw', lazy_build => 1);
has 'responseerror' => (is => 'rw');

use Carp;
use XML::Generator ':pretty';

sub _build_responsetree {
     my($self)=@_;

     use XML::TreeBuilder;
     my $tree = XML::TreeBuilder->new;
     $tree->parse($self->response);
     $tree;
}

sub process {
     my($self)=@_;

     use IO::File;
     use Win32::OLE::Const;
     Win32::OLE->Option(Warn => 2);

     use File::Slurp;

     my $appname = 'XML::Quickbooks';
     my $qb_company_file = '';

     my $qbxmlrp_const = Win32::OLE::Const->Load("QBXMLRP2 1.0 Type Library");

     my $request_processor = Win32::OLE->new("QBXMLRP2.RequestProcessor", 
					     sub {$_[0]->CloseConnection();}) or die "oops\n";

     $request_processor->OpenConnection2("", $appname, 
					 $qbxmlrp_const->{"localQBD"});

     my $ticket = $request_processor->BeginSession($qb_company_file, 
						   $qbxmlrp_const->{"qbFileOpenDoNotCare"});


     my $response_xml_string = $request_processor->ProcessRequest($ticket, $self->request);

     $self->response($response_xml_string);
}


sub as_xml {
     my ($self) = @_;

     my $x =
	  QBXML(
		QBXMLMsgsRq( {onError => "stopOnError"},
			     inner()
			     ));

     $self->request('<?xml version="1.0" encoding="utf-8"?> <?qbxml version="10.0"?>' . $x);
}

sub responseok {
     my($self)=@_;

     my $s = 'statusMessage';
     warn $self->responsetree;
     my $elem = $self->responsetree->look_down($s => qr/.+/);
     #warn $elem->as_HTML;
     my $status = $elem->attr($s);
     if ($status eq 'Status OK') {
	  1;
     } else {
	  $self->responseerror($status);
	  Carp::cluck($status);
	  0;
     }
	  
}


=head1 SYNOPSIS

    ...

=method method_x

This method does something experimental.

=method method_y

This method returns a reason.

=head1 SEE ALSO

=for :list
* L<Your::Module>
* L<Your::Package>

=cut
1;
