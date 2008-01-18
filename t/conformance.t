use strict;
use warnings;
use Test::More tests => 9;
use Crypt::PerfectPaperPasswords;

{
    my $ppp = Crypt::PerfectPaperPasswords->new;
    isa_ok $ppp, 'Crypt::PerfectPaperPasswords';

    is $ppp->alphabet,
      '23456789!@#%+=:?'
      . 'abcdefghijkmnopqrstuvwxyz'
      . 'ABCDEFGHJKLMNPRSTUVWXYZ', "default alphabet OK";

    my $key     = 'Rosebud';
    my $exp_seq = '1727f9eedb5128f0cdf892ad31eac287'
      . 'ea16e261fd7ff9007037807c3ebc02dc';

    my $got_seq = $ppp->sequence_from_key( $key );
    is $got_seq, $exp_seq, "Sequence OK";

    my $rand_seq = $ppp->random_sequence;
    like $rand_seq, qr/^[0-9a-f]{64}$/i, "Random sequence looks good";

    # There's a small chance of this test failing sometime before the
    # universe goes dark. I can live with that.
    my $another_seq = $ppp->random_sequence;
    isnt $another_seq, $rand_seq, "Sequence didn't repeat";
}

my @schedule = (
    {
        name => 'Data from PHP implementation',
        key  => '1727f9eedb5128f0cdf892ad31eac287'
          . 'ea16e261fd7ff9007037807c3ebc02dc',
        expect => [
            'gHqx', 'L+ZF', 'LmJm', 'qxd4', 'Et3K', 'wasq',
            'qBy+', 'KECu', 'EcVD', '%Uss', 'e2@X', 'n%N!',
            'V#ep', '%anU', '?hr8', 'mo%c', 'Mqre', 'rHn#',
            'ryGA', '%oJH', 'd6+x', 'ajaf', 'STcv', 'R2Pa',
            '%RCq', 'xkaT', 'LvWs', 'cBug', 'D632', 'zf4V',
            'CYSx', 'jeUG', 'Z+6b', '8Yib', '6tEi', '#o8v',
            'f4KG', 'X@8P', 'q!oa', 'rjrj', 'tVww', 'fMwz',
            'kWDi', 'RWZS', 'euRN', 'Lekx', '82Ca', 'KSeF',
            'Vwbi', '!:jT', 'j4C2', '@dis', '@gvu', 'o#z2',
            '@nnc', 'LT4h', 'Gh:M', 'LgPn', 'oDum', 'jf8p',
            'm=S8', 'YgV4', '=vAa', 'KegM', 'U@yS', ':uob',
            '8dnp', 'dTRC', '7wXm', 'h=du', 'wSdq', 'Ksnr',
            'TZRN', 'aL@G', 'n4jd', 'hSPi', 'xnVS', 'eWLF',
            'vUiA', '8yZm', 'z3?D', 'MVCG', 'obrB', '8NBs',
            'W#WK', '@Ugi', 'kiFT', 'K3Wk', 'aKfs', 'kEKX',
            ':Wcb', 'G=Mv', 'A??R', '4Pk#', ':jN?', '2TzP',
            'LBS3', '+g@k', '3=u%', 'DbaA',
        ]
    },
    {
        name   => 'Generated by grc.com',
        phrase => 'Grenade',
        expect => [
            '+U!8', 's9da', 'geGo', 'RFK7', 'nG2d', 'w6#=',
            '39@6', '6?2m', 'KmyN', 'vJyE', '8j%d', '%8Ya',
            'zS?S', '%z4o', 'indy', 'p3Go', 'Bsjc', 'CaH#',
            'BLM7', '2y2F', '%Vyt', '4?rm', 'oaX!', '4idq',
            '#i%r', '=deL', 'yGqf', 'tGUZ', 'gc+u', '8Tc2',
            'okPy', ':!+3', 'bVpk', 'RJWe', '=iVP', '2tRa',
            'zED+', '=4T#', 'yT2t', 'AFup', 'DSut', '2foS',
            '%UCe', 'oK##', 'ELEB', '2!Wj', 'ev#T', 'Wr58',
            'L2xe', '6hCq', '6d6B', 'fXU=', '@Et#', 'S38c',
            '%th7', 'CfeB', 'JW:%', 'EuuP', 'R3+L', ':9b2',
            '3?m6', 'CKp=', 'x3Y=', 'mAPq', 'VZke', 'm=HB',
            ':T3B', 'Z:Jy', '7zff', 'uyJD',
        ]
    },
);

for my $test ( @schedule ) {
    my $name = $test->{name};
    my $ppp  = Crypt::PerfectPaperPasswords->new;
    my $key
      = exists $test->{key}
      ? $test->{key}
      : $ppp->sequence_from_key( $test->{phrase} );
    my @expect = @{ $test->{expect} };
    is length( $key ), 64, "$name: Key length OK";
    my @got = $ppp->passcodes( 1, scalar @expect, $key );
    is_deeply \@got, \@expect, "$name: Passcodes match";
}
