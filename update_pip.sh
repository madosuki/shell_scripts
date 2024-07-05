#!/bin/sh

python -m pip list | awk '{if (NR > 2) {if ($1 == "") { exit } else { print $1 }}}' | xargs python -m pip install -U
