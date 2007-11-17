use strict;
use warnings;

use inc::Module::Install;

name 'Crypt-PerfectPaperPasswords';
all_from 'lib/Crypt/PerfectPaperPasswords.pm';

build_requires 'Test::More' => 0;
build_requires 'Test::Deep' => '0.096';

requires 'Crypt::Rijndael' => 0;
requires 'Digest::SHA256'  => 0;
requires 'Scalar::Util'    => 0;
requires 'Time::HiRes'     => 0;

license 'perl';
perl_version '5.008';

WriteAll( sign => 1 );
