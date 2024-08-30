# Gershwin Applications

This repository automates the installation of Gershwin Applications.

### Requirements

* [Gershwin System](https://github.com/gershwin-os/system.git)
* autoconf (required for backone apps)
* automake (required for backone apps)

## Applications Included

- **gap**: Chess
- **gap**: Terminal
- **apps-gorm**: Gorm - Interface Builder for GNUstep
- **apps-projectcenter**: Project Center - Integrated Development Environment (IDE) for GNUstep
- **textedit**: TextEdit - Text Editor from backbone

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

## Installation

Follow these steps to install Applications on Debian:

1. Clone the repository with submodules:

```
git clone https://github.com/gershwin-os/applications.git --recurse-submodules
```

2. Build the components:
```
cd applications && sudo make install
```

## Uninstallation

```
sudo make uninstall
```

## Cleanup

This command will remove the system.txz tar archive:

```
sudo make clean
```