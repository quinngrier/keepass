#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

#
# Example: bash update.bash 2.48.1
#

set -E -e -u -o pipefail || exit $?
trap exit ERR

version=$1
readonly version

wget \
  -O "KeePass-$version.zip" \
  "https://sourceforge.net/projects/keepass/files/KeePass%202.x/$version/KeePass-$version.zip/download" \
;

wget \
  -O "KeePass-$version.zip.asc" \
  "https://keepass.info/integrity/v2/KeePass-$version.zip.asc" \
;

wget \
  -O "KeePass-$version-Source.zip" \
  "https://sourceforge.net/projects/keepass/files/KeePass%202.x/$version/KeePass-$version-Source.zip/download" \
;

wget \
  -O "KeePass-$version-Source.zip.asc" \
  "https://keepass.info/integrity/v2/KeePass-$version-Source.zip.asc" \
;

gpg --verify "KeePass-$version.zip.asc"
gpg --verify "KeePass-$version-Source.zip.asc"

git rm '*.zip*'
git add *.zip*

rm -f -r KeePass
mkdir KeePass
unzip "KeePass-$version.zip" -d KeePass
git checkout -- KeePass/KeePass.config.xml
git add KeePass

