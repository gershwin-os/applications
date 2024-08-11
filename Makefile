# Makefile

# Check if running as root
check_root:
	@if [ $$(id -u) -ne 0 ]; then \
		echo "This Makefile must be run as root or with sudo."; \
		exit 1; \
	fi

# Define the target installation directory
TARGET_DIR := /Applications

# Define the install target
install: check_root
	@if [ -d "/Applications" ]; then \
	  echo "System appears to be already installed."; \
	  exit 0; \
	else \
	if [ -d "/__w/applications/applications/" ]; then \
	  WORKDIR="/__w/applications/applications/"; \
	elif [ -d "/home/runner/work/applications/applications/" ]; then \
	  WORKDIR="/home/runner/work/applications/applications/"; \
	else \
	  WORKDIR=`pwd`; \
	fi; \
	. /System/Library/Preferences/GNUstep.conf; \
	CPUS=`nproc`; \
	echo "CPUS is set to: $$CPUS"; \
	echo "WORKDIR is set to: $$WORKDIR"; \
	cd $$WORKDIR/gap/ported-apps/Games/Chess && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR/gap/system-apps/Terminal && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR/apps-gorm && gmake -j"${CPUS}" || exit 1 && gmake install; \
	cd $$WORKDIR/apps-projectcenter && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	fi;

# Define the uninstall target
uninstall: check_root
	@removed=""; \
	if [ -d "/Applications" ]; then \
	  rm -rf /Applications; \
	  removed="/Applications"; \
	  echo "Removed /Applications"; \
	fi; \
	if [ -n "$$removed" ]; then \
	  return 0; \
	else \
	  echo "System appears to be already uninstalled.  Nothing was removed"; \
	fi

clean: check_root
	FILE=applications.txz; \
	if [ -f $$FILE ]; then \
		echo "Removing $$FILE..."; \
		rm -f $$FILE; \
		echo "$$FILE removed successfully."; \
	else \
		echo "Nothing to clean."; \
	fi