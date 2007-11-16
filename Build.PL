use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Crypt::PerfectPaperPasswords',
    license           => 'perl',
    dist_author       => 'Andy Armstrong <andy@hexten.net>',
    dist_version_from => 'lib/Crypt/PerfectPaperPasswords.pm',
    requires          => {
        'Test::More' => 0,
    },
    add_to_cleanup => ['Crypt-PerfectPaperPasswords-*'],
);

$builder->create_build_script();
