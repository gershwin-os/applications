#!/bin/sh

# Exit immediately if any command exits with a non-zero status
set -e

# Ensure that submodules have been checked out
git submodule update --init --recursive

# Determine number of CPUs when building
CPUS=$(nproc)
export GNUSTEP_INSTALLATION_DOMAIN=LOCAL
. /Developer/Makefiles/GNUstep.sh

if [ -f "/__w/applications/applications/system_amd64.zip" ]; then
  export SRC="/__w/applications/applications/"
fi

if [ -f "/home/runner/work/applications/applications/system_arm64.zip" ]; then
  export SRC="/home/runner/work/applications/applications/"  
fi

cd ${SRC}/gap/ported-apps/Games/Chess && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install
cd ${SRC}/gap/system-apps/Terminal && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install