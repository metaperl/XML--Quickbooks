use File::Find;
find(\&wanted, '.');


sub wanted {
  return unless /(.+).xml/;
  my $root = $1;
  my $pkg = "XML::Quickbooks::Writer::$root";
  my $firstdepth = 4;
  my $prependlib = 'lib';
  my $fileheader = 'XML::Quickbooks::Writer';
  my @syscmd = (xwc => $_, $pkg, $firstdepth, $prependlib, $fileheader);
  system(@syscmd);
}

