package XML::Quickbooks::Query;

use Moose::Role;

sub exists {
  my($self,$opt)=@_;

  $self->submit($opt);
  $self->responseok;
}

1;
