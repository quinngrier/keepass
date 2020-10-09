#
# Example:
#
#       bash update.bash \
#         KeePass-2.40.zip \
#         04faa57d54881cf0e22daf0be47adf610f58e1db \
#         https://sourceforge.net/projects/keepass/files/KeePass%202.x/2.40/KeePass-2.40.zip/download \
#         KeePass-2.40-Source.zip \
#         51a2a6081132254ddb883863b29e59f6ed1bed59 \
#         https://sourceforge.net/projects/keepass/files/KeePass%202.x/2.40/KeePass-2.40-Source.zip/download \
#       ;
#

set -e -u -o pipefail || exit

bin_zip=$1
bin_sha=$2
bin_url=$3
src_zip=$4
src_sha=$5
src_url=$6

wget -O $bin_zip $bin_url
sha=$(sha1sum $bin_zip | sed "s/ .*//")
test $sha = $bin_sha

wget -O $src_zip $src_url
sha=$(sha1sum $src_zip | sed "s/ .*//")
test $sha = $src_sha

git rm "*.zip"
git add *.zip

rm -rf KeePass
mkdir KeePass
unzip $bin_zip -d KeePass
git checkout -- KeePass/KeePass.config.xml
git add KeePass

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
