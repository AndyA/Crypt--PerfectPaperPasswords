use strict;
#use warnings;
use ExtUtils::MakeMaker;

eval 'use ExtUtils::MakeMaker::Coverage';

WriteMakefile(
    ( MM->can( 'signature_target' ) ? ( SIGN => 1 ) : () ),
    NAME          => 'Crypt::PerfectPaperPasswords',
    AUTHOR        => 'Andy Armstrong <andy@hexten.net>',
    LICENSE       => 'perl',
    VERSION_FROM  => 'lib/Crypt/PerfectPaperPasswords.pm',
    ABSTRACT_FROM => 'lib/Crypt/PerfectPaperPasswords.pm',
    PL_FILES      => {},
    PREREQ_PM     => {
        'Test::More'      => 0,
        'Crypt::Rijndael' => 0,
        'Digest::SHA256'  => 0,
        'Getopt::Long'    => 0,
        'Scalar::Util'    => 0,
        'Time::HiRes'     => 0,
        'Getopt::Long'    => 0,
        'Pod::Usage'      => 0,
    },
    EXE_FILES => ['bin/pppp'],
    dist      => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Crypt-PerfectPaperPasswords-*' },
);
