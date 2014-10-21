#!perl

use strict;
use warnings;

use Test::More tests => 16;
use CPAN::Testers::WWW::Statistics::Graphs;

my @ranges = (
     { min => 1,       max => 9,       smax => 10,          steps => '1|2|3|4|5|6|7|8|9' },
     { min => 10,      max => 90,      smax => 90,         steps => '10|20|30|40|50|60|70|80|90' },
     { min => 100,     max => 300,     smax => 300,        steps => '100|150|200|250|300' },
     { min => 400,     max => 600,     smax => 600,        steps => '400|450|500|550|600' },
     { min => 4000,    max => 6000,    smax => 6000,       steps => '4k|4.5k|5k|5.5k|6k' },
     { min => 40000,   max => 64000,   smax => 65000,      steps => '40k|45k|50k|55k|60k|65k' },
     { min => 400000,  max => 690000,  smax => 700000,     steps => '400k|450k|500k|550k|600k|650k|700k' },
     { min => 4000000, max => 6900000, smax => 10000000,    steps => '4m|5m|6m|7m' },
);

for my $r (@ranges) {
    is(CPAN::Testers::WWW::Statistics::Graphs::_set_max($r->{max}),$r->{smax}, "max matches: $r->{max}");
    is(CPAN::Testers::WWW::Statistics::Graphs::_set_range($r->{min},$r->{max}),$r->{steps}, "range matches: $r->{min}");
}