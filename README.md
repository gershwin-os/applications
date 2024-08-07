# Gershwin Applications

This repository automates the installation of GNUstep Applications on Debian, utilizing submodules for a streamlined setup.

### Requirements

[Gershwin System](https://github.com/gershwin-os/system.git)

## Applications Included

- **gap**: Chess
- **gap**: Terminal
- **apps-gorm**: Gorm - Interface Builder for GNUstep
- **apps-projectcenter**: Project Center - Integrated Development Environment (IDE) for GNUstep

## Installation Paths (LOCAL domain)

The components are installed into directories under the LOCAL domain:

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

Follow these steps to install Applications on Debian:

1. Clone the repository with submodules:

```
git clone https://github.com/gershwin-os/applications.git --recurse-submodules
```

2. Source GNUstep.sh:
```
. /System/Makefiles/GNUstep.sh 
```

3. Build the components:
```
cd applications && sudo ./build.sh
```

4. Launch GWorkspace:
```
openapp GWorkspace
```