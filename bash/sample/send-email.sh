#!/usr/bin/env bash

MACHINE="i586"
OS="linux-gnu"
CC="gcc"
CFLAGS=" -DPROGRAM='bash' -DHOSTTYPE='i586' -DOSTYPE='linux-gnu' \
-DMACHTYPE='i586-pc-linux-gnu' -DSHELL -DHAVE_CONFIG_H -I. \
-I. -I./lib -g -O2"
RELEASE="2.01"
PATCHLEVEL="0"
RELSTATUS="release"
MACHTYPE="i586-pc-linux-gnu"
TEMP=/tmp/bbug.$$
case "$RELSTATUS" in
alpha*|beta*) BUGBASH=chet@po.cwru.edu ;;
*) BUGBASH=bug-bash@prep.ai.mit.edu ;;
esac
BUGADDR="${1-$BUGBASH}"
UN=
if (uname) >/dev/null 2>&1; then
UN=`uname -a`
fi
cat > $TEMP <<EOF
    From: ${USER}
    To: ${BUGADDR}
    Subject: [50 character or so descriptive subject here (for reference)]
    Configuration Information [Automatically generated, do not change]:
    Machine: $MACHINE
    OS: $OS
    Compiler: $CC
    Compilation CFLAGS: $CFLAGS
    uname output: $UN
    Machine Type: $MACHTYPE
    bash Version: $RELEASE
    Patch Level: $PATCHLEVEL
    Release Status: $RELSTATUS
    Description:
    [Detailed description of the problem, suggestion, or complaint.]
    Repeat-By:
    [Describe the sequence of events that causes the problem
    to occur.]
    Fix:
    [Description of how to fix the problem. If you don't know a
    fix for the problem, don't include this section.]
EOF

vi $TEMP

mail