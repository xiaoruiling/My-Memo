#!/bin/sh
# My second file

echo "倾尽天下"

myFunction()
{
  echo "\$1 is $1"
  echo "\$2 is $2"
}

a="a"
b="b"
myFunction $a $b


TAGS="TODO:|FIXME:|WARNING:"
ERRORTAG="ERROR:"
find "${SRCROOT}" \( -name "*.h" -or -name "*.m" -or -name "*.swift" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$|($ERRORTAG).*\$" | perl -p -e "s/($TAGS)/ warning: \$1/"| perl -p -e "s/($ERRORTAG)/ error: \$1/"
