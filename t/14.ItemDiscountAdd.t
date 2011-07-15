#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Writer::ItemDiscountAdd;

my $posting_account = makepostingacct();

my $tmpnam = "Test " . timestamp;
my $data   = {
    Name         => $tmpnam,
    DiscountRate => 10.55,
    AccountRef => {
      FullName => $posting_account
     }
};
my $Operation =
  XML::Quickbooks::Writer::ItemDiscountAdd->new( data => $data, maxwarn() );

#die Data::Dumper::Dumper($VendorAdd);

$Operation->process;

ok( $Operation->responseok, 'Check response' );

done_testing();




sub makepostingacct {
  my $posting_acct = 'Test' . timestamp;
  my($self)=@_;
  my %localarg = (Name => $posting_acct, AccountType => 'Income');
  use XML::Quickbooks::Writer::AccountAdd;
  my $o = XML::Quickbooks::Writer::AccountAdd->new(maxwarn(), data => \%localarg);
  warn Data::Dumper::Dumper($o);
  $o->submit;
  $posting_acct;
}
