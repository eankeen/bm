# package.md

It should be easy to install packages from GitHub. If an program binary is static, downloading and using the program should be automated and simple

## Conceptual Package Format

steps involved

1. program extraction
2. integrity assurance
3. identity assurance
4. actual installation

## Package Format

### Top Level Variables

-  name
-  version
-  integrity_check
-  identity_check

### Top Level Functions

-  pkg_install()

## Package Resources

Everything in `packages/common.sh` should be assumed to have a stable interface
