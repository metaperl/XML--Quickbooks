#!/usr/bin/perl

use t::lib::T;
use t::lib::U;
use t::lib::Quickbooks;

use Moose;

extends qw(XML::Quickbooks::Writer::InvoiceAdd);

use XML::Quickbooks::Writer::CustomerAdd;

# -- Add Customer
my $CustomerName = 'John' . datetimestamp;
XML::Quickbooks::Writer::CustomerAdd->new( data => { Name => $CustomerName } )
  ->submit;

# -- Make ARAccount

my $ARAccount = makeacct('AccountsReceivable');

# -- Add Products

my @product = map { $_ . timestamp } qw(jam jelly jehovah);

addinventory($_) for @product;

# override InvoiceLineAdd in our subclass

override '_tag_InvoiceLineAdd' => sub {
    my ($self) = @_;

    my $root = $self->data;
    use XML::Writer::Nest;

    my $W = $self->writer;
    for my $product (@product) {
        my $I = XML::Writer::Nest->new(
            tag    => 'InvoiceLineAdd',
            writer => $W
        );
        {
            my $R = $I->nest('ItemRef');
            $W->dataElement( FullName => $product );
        }
    }
};

# -- setup data

my %data = (
    CustomerRef  => { FullName => $CustomerName },
    ARAccountRef => { FullName => $ARAccount }
);

# -- execute operation

my $Operation =
  __PACKAGE__->new( data => \%data, maxwarn() );

$Operation->process;

ok( $Operation->responseok, 'Check response' );

done_testing();

