package XML::Quickbooks::Util;
# ABSTRACT: various utility functions

use Moose::Role;

sub trunc {
  my($self,$length, $string)=@_;

  substr($string, 0, $length);

}

sub hashrender {
  my($self, $key, $hash)=@_;
  return '' unless my $v = $hash->{$key} // undef;

  my $X = XML::Generator->new(pretty    => 2);
  $X->$key($v);
}

1;
