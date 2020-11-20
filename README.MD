# bm

`bm` is a userspace binary / executable file manager that manages binary files and their simple dependencies and side effects

Many tools are provided as single binaries. Using system package managers to install these tools is unecessary, especially since system packages managers are out of date or don't contain all the necessary content (ex. Packer on Ubuntu doesn't include autocomplete)

## Features

- [x] Installs packages
- [ ] Manages package side effects
- [ ] Lists packages
- [ ] Lists versions of packages
- [ ] Switch package versions

Right now, it simply installes packages. Later, it should facilitate tool version discovery and installation version priority management of aforementioned packages

## Usage

```sh
git clone https://github.com/eankeen/bm
alias bm="$PWD/bm/bm.sh"

cd
bm vagrant
bm z
```

## Support

64-Bit Linux Machines
