# Gershwin Applications

This repository automates the installation of GNUstep Applications on Debian, utilizing submodules for a streamlined setup.

### Requirements

[Gershwin System](https://github.com/gershwin-os/system.git)

## Applications Included

- **gap**: Chess
- **gap**: Terminal

## Installation Paths (LOCAL domain)

The components are installed into directories under the LOCAL domain, organized in a hierarchical structure that mimics the developer environment found in original Mac OS X versions:

- **Applications**: `/Applications`
- **Admin Applications**: `/Applications/Utilities`
- **Web Applications**: `/Library/WebApplications`
- **Tools**: `/Library/bin`
- **Admin Tools**: `/Library/sbin`
- **Library**: `/Library`
- **Headers**: `/Developer/Headers`
- **Libraries**: `/Library/Libraries`
- **Documentation**: `/Library/Documentation`
- **Man Pages**: `/Library/Documentation/man`
- **Info Pages**: `/Library/Documentation/info`

## Usage (Debian)

Follow these steps to set up Gershwin System on Debian:

1. Clone the repository with submodules:

```
git clone https://github.com/gershwin-os/applications.git --recurse-submodules
```

2. Source GNUstep.sh:
```
. /Developer/Makefiles/GNUstep.sh 
```

3. Build the components:
```
cd applications && sudo ./build.sh
```

4. Launch GWorkspace:
```
openapp GWorkspace
```