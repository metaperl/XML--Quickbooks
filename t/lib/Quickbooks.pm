package t::lib::Quickbooks;

use strict;
use warnings;

use t::lib::U;

require Exporter;
our @ISA    = qw(Exporter);
our @EXPORT = qw(addinventory makeacct);

sub addinventory {
    my ($productname) = @_;

    my $data   = {
        Name             => $productname,
        IncomeAccountRef => { FullName => makeacct('Income') },
        AssetAccountRef  => { FullName => makeacct('FixedAsset') },
        COGSAccountRef   => { FullName => makeacct('CostOfGoodsSold') }
    };
    use XML::Quickbooks::Writer::ItemInventoryAdd;
    my $Operation = XML::Quickbooks::Writer::ItemInventoryAdd->new(
        data => $data,
        maxwarn()
    );

    $Operation->process;

    if ( $Operation->responseok ) {
        return 1;
    }
    else {
        die 'Inventory add failed ' . $Operation->responsemsg;
    }
}

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

1;
