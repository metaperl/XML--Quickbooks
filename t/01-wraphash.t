use t::lib::T;
use t::lib::U;

use XML::Quickbooks;

my $self = XML::Quickbooks->new;

my %data = ( Name => "Jolly Green Giant" );

my $wrapped = $self->wraphash( \%data, qw(AddCustomerRq AddCustomer) );

my $exp = {
    QBXML => {
        QBXMLMsgsRq => {
            AddCustomerRq => { AddCustomer => { Name => "Jolly Green Giant" } }
        }
    }
};

is_deeply( $wrapped, $exp, 'compare hash wrapping' );

warn Data::Dumper::Dumper( $wrapped, $exp );
done_testing();
