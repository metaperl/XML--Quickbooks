package XML::Quickbooks::RequestProcessor;

use Moose;

has 'appname' => (is => 'rw', default => 'XML::QuickBooks');
has 'company_file' => (is => 'rw', default => '');

sub process {
    my($self,@request)=@_;

    use IO::File;
    use Win32::OLE::Const;
    Win32::OLE->Option(Warn => 2);

    my @response;

    my ($request_processor, $ticket);
    for my $request (@request) {

	my $qbxmlrp_const = Win32::OLE::Const->Load("QBXMLRP2 1.0 Type Library");

	$request_processor = Win32::OLE->new("QBXMLRP2.RequestProcessor", 
						sub {$_[0]->CloseConnection();}) or die "oops\n";

	$request_processor->OpenConnection2("", $self->appname, 
					    $qbxmlrp_const->{"localQBD"});

	$ticket = $request_processor->BeginSession($self->company_file, 
						      $qbxmlrp_const->{"qbFileOpenDoNotCare"});

	my $response_xml_string = $request_processor->ProcessRequest($ticket, $request);

	push @response, $response_xml_string;
    }

    $request_processor->EndSession($ticket);

    @response;
}



1;
