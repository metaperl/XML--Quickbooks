#!/usr/bin/perl

use t::lib::T;
use t::lib::U;

use XML::Quickbooks::Writer::ItemInventoryAdd;

my $tmpnam = "Test " . timestamp;
my $data   = {
    Name             => $tmpnam,
    IncomeAccountRef => { FullName => makeacct('Income') },
    AssetAccountRef  => { FullName => makeacct('FixedAsset') },
    COGSAccountRef   => { FullName => makeacct('CostOfGoodsSold') }
};
my $Operation =
  XML::Quickbooks::Writer::ItemInventoryAdd->new( data => $data, maxwarn() );

#die Data::Dumper::Dumper($VendorAdd);

$Operation->process;

ok( $Operation->responseok, 'Check response' );

done_testing();

sub makeacct {
    my $posting_acct = 'Test' . timestamp;
    my ($type)       = @_;
    my %localarg     = ( Name => $posting_acct, AccountType => $type );
    use XML::Quickbooks::Writer::AccountAdd;
    my $o =
      XML::Quickbooks::Writer::AccountAdd->new( maxwarn(), data => \%localarg );
    warn Data::Dumper::Dumper($o);
    $o->submit;
    $posting_acct;
}
