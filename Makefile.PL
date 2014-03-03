use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'PlackSession',
    AUTHOR              => q{Lee Carmichael <leecarmichael123@gmail.com>},
    VERSION_FROM        => 'lib/v.pm',
    ABSTRACT            => 'test app with plack and dancer sharing session',
    ($eumm_version >= 6.3001
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.3114,
        'Task::Plack' => 0,
        'Dancer::Session::PSGI' => 0,
    },
    #dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    #clean               => { FILES => 'PlackSession-*' },
);
