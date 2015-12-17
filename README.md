# bamboo
Perl 6 dependency manager (bundler)

# Dependencies

- [Panda](https://github.com/tadzik/panda)

# Installation

To install, just type:

		panda install bamboo

# Usage

Bamboo installs dependencies under `$*CWD/lib` (what is `./lib`)
after getting the dependency list from `META.info` (or `.pandafile`)
from directory defined as `--path` parameter (what is `./` by default).

To install dependencies, just write:

		bamboo install

to change the dependency-list file location, use `--path` parameter:

		bamboo --path=src install

and done. Enjoy! :)

# TODO

- implement bin/bamboo init