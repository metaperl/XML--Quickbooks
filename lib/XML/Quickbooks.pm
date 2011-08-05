package XML::Quickbooks;

# ABSTRACT: XML::Toolkit classes for manipulating Quickbooks

use Moose;
with 'XML::Quickbooks::Util';
with 'XML::Quickbooks::Log';

use Carp::Always;
use XML::Element;
use XML::Twig;
use XML::TreeBuilder;

use XML::Quickbooks::RequestProcessor;

has 'request' => (
    is      => 'rw',
    trigger => \&_warnrequest
);

has 'response' => (
    is      => 'rw',
    trigger => \&_warnresponse
);

has 'tree' => ( is => 'rw' );

has 'warnrequest'  => ( is => 'rw', default => 0 );
has 'warnresponse' => ( is => 'rw', default => 0 );

sub _warnrequest {
    my ($self) = @_;
    warn "WR: " . $self->warnrequest;
    $self->warnrequest and $self->log->logcarp( $self->request );
}

sub _warnresponse {
    my ($self) = @_;
    $self->warnresponse and $self->log->logcarp( $self->response );
}

use Carp;

sub dumper {
    my $self = shift;
    use Data::Dumper;
    $self->log->logcarp( Dumper(@_) );
}

sub pretty_print {
    my ( $self, $xml ) = @_;

    my $twig = XML::Twig->new(
        pretty_print => 'indented',    # output will be nicely formatted
    );
    $twig->parse($xml);
    $twig->sprint;
}

sub warnall {
    qw(warnrequest => 1 warnresponse => 1);
}

sub exists {
    my ( $self, $opt ) = @_;

    $self->submit($opt);
    $self->responseok;
}

sub responsetree {
    my ($self) = @_;

    if ( length $self->response < 5 ) {
        Carp::confess('response is too small');
    }

    my $tree =
      XML::TreeBuilder->new( { 'NoExpand' => 0, 'ErrorContext' => 0 } );
    $tree->parse( $self->response );

    $self->tree($tree);
    $tree;
}

sub responselistid {
    my ($self) = @_;

    my $t        = $self->responsetree;
    my $elem     = $t->look_down( '_tag' => 'ListID' );
    my ($listid) = $elem->content_list;
    $listid;

}

sub responsetxnid {
    my ($self) = @_;

    my $t       = $self->responsetree;
    my $elem    = $t->look_down( '_tag' => 'TxnID' );
    my ($txnid) = $elem->content_list;
    $txnid;

}

sub responsecode {
    my ($self) = @_;

    my $s = 'statusCode';

    #warn $self->responsetree;
    my $elem = $self->responsetree->look_down( $s => qr/.+/ );

    #warn $elem->as_HTML;
    my $status = $elem->attr($s);
    $self->log->logwarn("status:$status:");
    int($status);
}

sub responseok {
    my ($self) = @_;

    not $self->responsecode;
}

sub responsemsg {
    my ($self) = @_;

    my $s = 'statusMessage';

    #warn $self->responsetree;
    my $elem = $self->responsetree->look_down( $s => qr/.+/ );

    #warn $elem->as_HTML;
    my $status = $elem->attr($s);
}

sub evaluate {
    my ( $self, $r ) = @_;

    my $response = $r // $self->response;

    $self->response($response);
    $self->responseok;
}

sub process {
    my $self = shift;

    #warn 'forming XML';
    $self->as_xml(@_);

    #warn 'forming XML DONE';

    #warn "How does self look: "; $self->dumper($self);
    my $p = XML::Quickbooks::RequestProcessor->new;
    my ($response) = $p->process( $self->request );

    #warn 'Lets see self again'; $self->dumper($self);

    $self->response($response);

    #warn 'Lets see self one more time'; $self->dumper($self);

    $self->responsecode;
}

sub submit { goto &process; }

sub DEMOLISH {
    my ($self) = @_;
    $self->tree->delete if $self->tree;
}

=head1 NAME

XML::Quickbooks - XML-based interface to Quickbooks SDK

=head1 SYNOPSIS

  my $data = { Name => 'John Smith' };
  my $operation = 'CustomerAdd';
  my $class = "XML::Quickbooks::Writer::$operation";
  Class::MOP::load_class($class);
  my $operationObject = $class->new(data => $data);
  $operationObject->process;

=head1 DESCRIPTION

XML::Quickbooks is a Perl interface to the Quickbooks SDK:
L<https://ipp.developer.intuit.com/#Desktop_SDK_Software>

Though most resources at Intuit are focused on the Intuit Partner Platform, the Quickbooks SDK
is still available for manipulating Quickbooks file programmatically and it is a far more
robust choice than QIF and IIF Files.

Using XML::Quickbooks is quite straightforward. The underlying XML and object-oriented
code was designed for maximum re-use and extension.

=head1 USAGE

Basically, one simply instantatates an instance of the Quickbooks operation one wants to 
perform and provides this instance with data relevant to the operation, as documented in the
Intuit OSR
L<https://member.developer.intuit.com/qbSDK-current/Common/newOSR/index.html>
and then calls C<< ->process() >>.

Eleven Quickbooks operations are available. The test suite shows how they are used.

=head2 Format of the data hashref

The data supplied to your operation object mimics the nested structure of the XML: the
keys in the hashref map to elements in the XML. The values of keys lead deeper into the structure 
or indicate the content for a terminal XML element. 

=head1 Software design issues

=head2 Dynamically building ordered XML from a hashref, not for XML::Simple

Dynamically building XML from a hashref is something that L<XML::Simple> has done for a
long time. However, the Quickbooks SDK is order-sensitive and the order of a hash does not
lead to the order of the generated XML. The XML technology used in XML::Quickbooks does in
fact take a hashref yet preserve order. Several iterations occurred with this code, before
stabilizing with L<XML::Writer::Compiler> as the underlying technology.

Several modules were surveyed and others used before settling on L<XML::Writer::Compiler>.

This section discusses various options for dynamic XML generation.

=head3 XML::Generator

I initially used L<XML::Generator> for building XML for XML::Quickbooks, and the code for doing so
is still part of this distro. However, one day when dynmically loading Moose classes,
the generated XML came out something like this:

    <new>Moose::Classname</new>

In other words, instead of C<< Moose::Classname->new >> leading to a new object, the 
XML::Generator AUTOLOAD magic had taken a supposedly non-existent class and presumed that my
method call was a requested to generate XML.

I had serious phobia about overloading method call semantics with XML generation. I never
believed in mixing Object Level and the Meta Level (if you've read Hoftatder's GEB). And 
I was also more manual in my processing of hashrefs into XML. So I decided to drop this method.

=head3 XML::Toolkit and XML::Element::Tolol

Well L<XML::Toolkit> really impressed with its approach to generating XML for awhile.
However, in using it, I found that it generated numerous classes for a single XML file. 
It seemed class-based as opposed to object-based. It seemed like L<Class::DBI> as opposed to
L<DBIx::Class>. But most importantly, I had the desire for a single hashref to unroll into
ordered XML. So, while stimulating to my thought processes, it led to to search for something
object-oriented and yet hash-driven.

I mused on my desires in 
L<Moose, the tree structure of XML and object-oriented inheritance hiearchies|http://perlmonks.org/?node_id=910617>

=head4 XML::Element::Tolol

L<XML::Element> is a complete XML generation API. Any type of XML, including mixed content, can be
generated with it. Additionally, the XML can be ordered, since the input data structure is a 
nested arrayref.

Thought there was nothing deeply object-oriented about using to C<tolol> method from
L<HTML::Element>, I thought it was worth exploring.

Implementing the Quickbooks SDK XML with XML::Element::Tolol was fine until I needed to
"unroll" a section of the XML repeatedly, instantiating it with data each time. To do so
required list surgery and lots of precise thinking, as documented in the "iterated data" section
of 
L<generating XML with data structures and Perl classes - the XML::Element::Tolol approach|http://perlmonks.org/?node_id=913713>

I wanted to make the process more DWIM instead of thinking about how to splice and rmap over lists.
That led to what I feel is the final underlying technology for XML::Quickbooks

=head2 XML::Writer::Compiler

L<XML::Writer> is another complete XML generation solution. It can generate any and all XML and 
does so via an object-oriented interface. I wrote L<XML::Writer::Compiler> so that you can
have the ordering of XML implied by a sample XML file, instantiate simple cases via a hashref
and yet have easy DWIM object-oriented manipulation of XML elements for complex unrolling.


=head2 Logging

Logging is a tough thing to figure out. It's necessary for large scale software but you dont want
to settle on one logging solution that is at odds with the solution being used for the rest of the 
software. 

=head1 SEE ALSO

=for :list
* L<OSR|https://member.developer.intuit.com/qbSDK-current/Common/newOSR/index.html>
* L<SDK Reference|https://member.developer.intuit.com/qbSDK-Current/doc/html/wwhelp/wwhimpl/js/html/wwhelp.htm?context=QBSDKProGuide&topic=QBSDKProGuide2>
* L<SDK Index|https://ipp.developer.intuit.com/0085_QuickBooks_Windows_SDK/010_qb/0050_Documentation/Manuals>
* L<Intuit Forums|https://idnforums.intuit.com/categories.aspx?catid=7>
* L<Early sample code|http://www.devx.com/xml/Article/30482/1954>

=cut

1;
