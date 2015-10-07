use v6;
use Test;

use Bamboo;

my $bamboo = Bamboo.new;

say $bamboo.perl;

$bamboo.install;
