#!/bin/sh
MYDIR="$(cd "$(dirname "$0")"; pwd)"
mono "$MYDIR"/demand-fs.exe $@
