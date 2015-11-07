use v6;
use Test;

use Bamboo;

my $bamboo = Bamboo.new(:path("t"));

say $bamboo.perl;

$bamboo.install;
