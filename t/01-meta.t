use v6;
use Test;

use Bamboo;

{
    my $bamboo = Bamboo.new(:prefix<t>, :path<t>);

    $bamboo.install;

    ok "t/lib/URI".IO.d, "installs modules";
}

done-testing;
