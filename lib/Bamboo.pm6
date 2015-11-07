unit class Bamboo;

use v6;

use Panda;
use Panda::App;
use JSON::Fast;

my @config-files = "META.info", ".pandafile";

has $.project-name;
has $.author;
has $.version;
has $.source-url;
has $.description;
has @.dependencies;

submethod BUILD(:$path = ".") {
    if ($path ~ "/META.info").IO.e {
        my $meta = from-json(slurp($path ~ "/META.info"));
        $!project-name = $meta<name>;
        $!author = $meta<author>;
        $!version = $meta<version>;
        $!source-url = $meta<source-url>;
        $!description = $meta<description>;
        @!dependencies = $meta<depends>.flat;
    }
    elsif ($path ~ "/.pandafile").IO.e {
        @!dependencies = ($path ~ "/.pandafile").IO.lines;
    }
    else {
        die "There is no .pandafile nor META.info in given path."
    }
}

method install() {
    say "===> Installing...";

    my $panda = Panda.new(
        ecosystem => make-default-ecosystem(),
        # XXX : destdir doesn't work
        installer => Panda::Installer.new(destdir => "{$*CWD}/lib")
    );

    for @.dependencies -> $module {
        $panda.resolve($module, :action<install>)
            unless $module ~~ "Panda"; # Panda should be installed, right? :)
    }
}
