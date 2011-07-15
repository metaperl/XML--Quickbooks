package t::lib::U;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(datetimestamp timestamp maxwarn);

use Data::Random;

use DateTime;

sub maxwarn { qw(warnrequest 1 warnresponse 1) }

sub datetimestamp {

  my $dt = DateTime->now;
  $dt->set_time_zone( 'America/New_York' );

  my $tmpnam = sprintf "%02d-%02d-%02d-%02d-%02d-%02d", 
    $dt->month, $dt->day, $dt->year,
      $dt->hour, $dt->minute, $dt->second;

}

sub timestamp {

  my $dt = DateTime->now;
  $dt->set_time_zone( 'America/New_York' );

  my $tmpnam = sprintf "%02d-%02d-%02d",
    $dt->hour, $dt->minute, $dt->second;

}

1;
