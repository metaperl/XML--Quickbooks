package XML::Quickbooks;
# ABSTRACT: XML::Toolkit classes for manipulating Quickbooks

use Moose;

has 'request' => (
  is => 'rw',
  trigger => \&_warnrequest
 );

has 'response' => (
  is => 'rw',
  trigger => \&_warnresponse
 );

has 'tree' => (is => 'rw');

has 'warnrequest'  => (is => 'rw', default => 0);
has 'warnresponse' => (is => 'rw', default => 0);

sub _warnrequest {
  my ($self)=@_;
  $self->warnrequest and Carp::cluck($self->request);
}

sub _warnresponse {
  my ($self)=@_;
  $self->warnresponse and Carp::cluck($self->response);
}

use Carp;

sub dumper {
  my ($self, $ref)=@_;
  use Data::Dumper;
  warn Dumper($ref);
}

sub responsetree {
  my($self)=@_;

  use XML::TreeBuilder;
  $self->tree(XML::TreeBuilder->new);

  if (length $self->response < 5) {
    Carp::confess('response is too small');
  }
  
  $self->tree->parse($self->response);
  $self->tree;
}

sub responselistid {
  my($self)=@_;

  my $t = $self->responsetree;
  my $elem = $t->look_down('_tag' => 'ListID');
  my ($listid) = $elem->content_list;
  $listid;

}

sub responsecode {
  my($self)=@_;

  my $s = 'statusCode';
  #warn $self->responsetree;
  my $elem = $self->responsetree->look_down($s => qr/.+/);
  #warn $elem->as_HTML;
  my $status = $elem->attr($s);
  int($status);
}


sub responseok {
  my($self)=@_;

  not $self->responsecode;
}

sub responsemsg {
  my($self)=@_;

  my $s = 'statusMessage';
  #warn $self->responsetree;
  my $elem = $self->responsetree->look_down($s => qr/.+/);
  #warn $elem->as_HTML;
  my $status = $elem->attr($s);
}

sub evaluate {
  my($self, $r)=@_;

  my $response = $r // $self->response;

  $self->response($response);
  $self->responseok;
}

sub process {
  my $self = shift;

  $self->as_xml(@_);

  use XML::Quickbooks::RequestProcessor; 

  my $p = XML::Quickbooks::RequestProcessor->new;
  my ($response) = $p->process($self->request);
  $self->response($response);
  $response;
}

sub submit { goto &process; }

sub DEMOLISH {
  my($self)=@_;
  $self->tree->delete if $self->tree;
}

=head1 SYNOPSIS

    ...

=method method_x

This method does something experimental.

=method method_y

This method returns a reason.

=head1 ACKNOWLEDGEMENTS

=head2 Matthew S. Trout

    [16:27] <mst> uh, perl always adds '.' to @INC
    [16:28] <mst> well, except when running setuid
    [16:28] <mst> this is how Module::Install's 'use inc::Module::Install' works

    [16:38] <mst> metaperl: just add the Test::More functions to your @EXPORT
    [16:38] <mst> presto fucking exporto :)

=head1 SEE ALSO

=for :list
* L<OSR|https://member.developer.intuit.com/qbSDK-current/Common/newOSR/index.html>
* L<SDK Reference|https://member.developer.intuit.com/qbSDK-Current/doc/html/wwhelp/wwhimpl/js/html/wwhelp.htm?context=QBSDKProGuide&topic=QBSDKProGuide2>
* L<SDK Index|https://ipp.developer.intuit.com/0085_QuickBooks_Windows_SDK/010_qb/0050_Documentation/Manuals>
* L<Intuit Forums|https://idnforums.intuit.com/categories.aspx?catid=7>
* L<Early sample code|http://www.devx.com/xml/Article/30482/1954>

=cut
1;
