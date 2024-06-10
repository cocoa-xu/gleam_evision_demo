# gleam_evision_demo

A very early stage demo of gleam_evision.

### Set up

First, clone this repo

```bash
$ git clone https://github.com/cocoa-xu/gleam_evision_demo.git
```

Then, we need to download the precompiled evision library

```bash
$ cd gleam_evision_demo

# **IMPORTANT**: Please replace the `TARGET` with your target platform
# Supported platforms: 
# - aarch64-apple-darwin
# - aarch64-linux-gnu
# - aarch64-linux-musl
# - aaarch64-windows-msvc
# - armv6-linux-gnueabihf
# - armv7l-linux-gnueabihf
# - i686-linux-gnu
# - ppc64le-linux-gnu
# - riscv64-linux-gnu
# - s390x-linux-gnu
# - x86_64-apple-darwin
# - x86_64-linux-gnu
# - x86_64-linux-musl
# - x86_64-windows-msvc
TARGET=aarch64-apple-darwin

# extra modules
#
# Supported modules:
# - `-contrib-`
# - `-contrib-cuda118-` (only for x86_64-linux-* and x86_64-windows-msvc)
# - `-contrib-cuda121-` (only for x86_64-linux-* and x86_64-windows-msvc)
#
# if you don't need any extra modules, please set it to an empty string
EXTRA_MODULES="-contrib-"

# only 0.2.2-rc0 is available now
EVISION_VERSION=0.2.2-rc0
PRECOMPILED_NAME="gleam_evision-nif_2.16-${TARGET}${EXTRA_MODULES}${EVISION_VERSION}"
GIT_TAGGED_VERSION="v${EVISION_VERSION}"

curl -fSL "https://github.com/cocoa-xu/evision/releases/download/${GIT_TAGGED_VERSION}/${PRECOMPILED_NAME}.tar.gz" -o "${PRECOMPILED_NAME}.tar.gz"
tar -xf "${PRECOMPILED_NAME}.tar.gz"
mv "${PRECOMPILED_NAME}/priv" priv
cp -a ${PRECOMPILED_NAME}/gleam_generated/* src/
```

### Have Fun

```sh
gleam run   # Run the project
gleam shell # Run an Erlang shell
```
