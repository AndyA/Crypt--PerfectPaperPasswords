#!/usr/bin/perl

use strict;
use warnings;

$| = 1;

my $str = ' ABC';
my $int = unpack 'N', $str;
printf("%04x\n", $int);
