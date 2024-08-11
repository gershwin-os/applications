#!/bin/sh

# Exit immediately if any command exits with a non-zero status
set -e

# Determine number of CPUs when building
CPUS=$(nproc)
export GNUSTEP_INSTALLATION_DOMAIN=LOCAL
. /System/Makefiles/GNUstep.sh

# Initialize WORKDIR to empty (if not already set)
export WORKDIR=""

# Detect whether or not GitHub actions is being used
if [ -d "/__w/applications/applications/" ]; then
  echo "GH actions AMD64 runner detected"
  export WORKDIR="/__w/applications/applications/"
fi

if [ -d "/home/runner/work/applications/applications/" ]; then
  echo "GH actions ARM64 runner detected"
  export WORKDIR="/home/runner/work/applications/applications/"
fi

if [ -z "$WORKDIR" ]; then
  echo "WORKDIR is empty, setting it to current working directory"
  WORKDIR="$PWD"
fi

echo "WORKDIR is set to: $WORKDIR"

if [ -f "/__w/applications/applications/system_amd64.zip" ]; then
  export SRC="/__w/applications/applications/"
fi

if [ -f "/home/runner/work/applications/applications/system_arm64.zip" ]; then
  export SRC="/home/runner/work/applications/applications/"  
fi

cd ${WORKDIR}/gap/ported-apps/Games/Chess && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install
cd ${WORKDIR}/gap/system-apps/Terminal && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install
cd ${WORKDIR}/apps-gorm && gmake -j"${CPUS}" || exit 1 && gmake install
cd ${WORKDIR}/apps-projectcenter && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install
