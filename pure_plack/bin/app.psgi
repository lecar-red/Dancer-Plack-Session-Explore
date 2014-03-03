use Plack::Builder;
use JSON qw( to_json );
 
my $app = sub {
    my $env = shift;
    my $session = $env->{'psgix.session'};
    return [
        200,
        [ 'Content-Type' => 'application/json' ],
        [ to_json({ visits => $session->{counter}++ }) ],
    ];
};
 
# Or, use the File store backend (great if you use multiprocess server)
# For more options, see perldoc Plack::Session::Store::File
builder {
    enable 'Session', store => 'File';
    $app;
};
