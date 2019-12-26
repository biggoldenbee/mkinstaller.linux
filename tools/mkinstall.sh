#!/bin/sh
# Copyright 2019 FOTON
#

#to calculate SHA512SUM and try to retrieve exact SHA512SUM and VERSION info
VALUE=$(sha512sum $1)
SHA512SUM=${VALUE% *}
VALUE=${VALUE#* }
VERSION=${VALUE%_*}
#to eliminate space from strings
SHA512SUM=`echo $SHA512SUM`
VERSION=$2
#to create a new install script
cat /dev/null > $1.sh
echo "#!/bin/sh" >> $1.sh
echo "# Copyright 2019 FOTON "$(date) >> $1.sh
echo "FILENAME="$1 >> $1.sh
echo "SHA512SUM="$SHA512SUM >> $1.sh
echo "VERSION="$VERSION >> $1.sh

cat install_script $1 >> $1.sh
chmod +x $1.sh
rm -rf $1

