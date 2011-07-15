package XML::Quickbooks::Log;
use Moose::Role;
use Log::Log4perl;

BEGIN {
	my $cfg = <<EOCFG;
log4j.rootLogger=DEBUG, stdout, R
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%5p (%F:%L) - %m%n
log4j.appender.R=org.apache.log4j.RollingFileAppender
log4j.appender.R.File=local.log
log4j.appender.R.layout=org.apache.log4j.PatternLayout
log4j.appender.R.layout.ConversionPattern=%p %c - %m%n
EOCFG
  Log::Log4perl->init(\$cfg);
      }

with 'MooseX::Log::Log4perl';

1;
