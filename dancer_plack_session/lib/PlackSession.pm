package PlackSession;

use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    print STDERR "stderr from get '/' test\n";
    return to_json { visits => session('counter') // 0 };
};

# yeah, i know should be put/post but i'm being lazy with curl
get '/inc' => sub {
    my $c = session('counter') // 0;

    session counter => ($c + 1);

    return to_json { updated => 1, visits => session('counter') };
};

true;
