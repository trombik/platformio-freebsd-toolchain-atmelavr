#!/bin/sh

: ${AVR_DIR:="/usr/local/avr"}
: ${AVR_GCC_DIR:="/usr/local/lib/gcc/avr"}

VERSION="1.50400.0"
DESC="toolchain-atmelavr"
REPO_NAME="platformio-freebsd-${DESC}"
REPO_OWNER="trombik"

ARCH=`uname -p`
OS=`uname -s | tr '[[:upper:]]' '[[:lower:]]'`

if [ ! -z $1 ]; then
    VERSION="$1"
fi

ln -s -f ${AVR_DIR} .
mkdir -p lib/gcc
ln -s -f ${AVR_GCC_DIR} lib/gcc/avr

cat <<__EOF__ >package.json
{
    "description": "${DESC}",
    "name": "${DESC}",
    "system": [
        "${OS}_${ARCH}"
    ],
    "url": "https://github.com/${REPO_OWNER}/${REPO_NAME}",
    "version": "${VERSION}"
}
__EOF__
