package XML::Quickbooks::RequestProcessor;

use Moose;

has 'appname'      => ( is => 'rw', default    => 'XML::QuickBooks' );
has 'company_file' => ( is => 'rw', default    => '' );
has 'const'        => ( is => 'rw', lazy_build => 1 );
has 'connection'   => ( is => 'rw', lazy_build => 1 );
has 'ticket'       => ( is => 'rw' );

sub DEMOLISH {
    my ($self) = @_;
    $self->connection->EndSession( $self->ticket );
}

sub _build_connection {
    my ($self) = @_;

    my $request_processor =
      Win32::OLE->new( "QBXMLRP2.RequestProcessor",
        sub { $_[0]->CloseConnection(); } )
      or die "Connection to Quickbooks failed";

    warn "RP:     $request_processor ";

    $request_processor->OpenConnection2(
        "",
        $self->appname,
        #$self->const->{"localQBDLaunchUI"},
        $self->const->{"localQBD"},
    );
    $request_processor;
}

sub _build_const {
    my $qbxmlrp_const = Win32::OLE::Const->Load("QBXMLRP2 1.0 Type Library");
}

sub process {
    my ( $self, @request ) = @_;

    use IO::File;
    use Win32::OLE::Const;
    Win32::OLE->Option( Warn => 2 );

    my @response;

    my ( $request_processor, $ticket );
    for my $request (@request) {

        $self->ticket(
            $self->connection->BeginSession(
                $self->company_file, $self->const->{"qbFileOpenDoNotCare"}
            )
        );

        $self->ticket or die "Connection to Quickbooks failed.
Check to see that it is running
and the company file is open.";

        warn sprintf "TICKET: %s", $self->ticket;

        warn "REQUEST: $request";
        my $response_xml_string =
          $self->connection->ProcessRequest( $self->ticket, $request );

        push @response, $response_xml_string;
    }

    @response;
}

1;
