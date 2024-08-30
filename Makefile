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
	. /System/Makefiles/GNUstep.sh; \
	CPUS=`nproc`; \
	echo "CPUS is set to: to: $$WORKDIR"; \
	cd $$WORKDIR/gap/ported-apps/Games/Chess && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR/gap/system-apps/Terminal && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR/apps-gorm && gmake -j"${CPUS}" || exit 1 && gmake install; \
	cd $$WORKDIR/apps-projectcenter && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR && git apply --check backbone-unset-system.patch && git apply backbone-unset-system.patch; \
	cd $$WORKDIR/backbone/system ./bootstrap && ./configure ; \
	cd $$WORKDIR/backbone/System/Frameworks/BBAppKit && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR/backbone/System/Applications/TextEdit && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install; \
	cd $$WORKDIR && tar -cJvf applications.txz /Applications /Library; \
	fi;

# Define the uninstall target
uninstall: check_root
	@removed=""; \
	if [ -d "/Applications" ]; then \
	  rm -rf /Applications; \
	  removed="/Applications"; \
	  echo "Removed /Applications"; \
	fi; \
	if [ -d "/Library" ]; then \
	  rm -rf /Library; \
	  removed="$$removed /Library"; \
	  echo "Removed /Library"; \
	fi; \
	if [ -n "$$removed" ]; then \
	  echo "Removed the following directories: $$removed"; \
	  return 0; \
	else \
	  echo "No directories needed to be removed."; \
	  return 1; \
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