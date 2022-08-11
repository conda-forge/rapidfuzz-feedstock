#!/bin/bash

set -ex


export CMAKE_OSX_ARCHITECTURES="arm64"
# workaround for https://github.com/scikit-build/scikit-build/issues/589
rm -rf $PREFIX/lib/libpython$PY_VER.dylib
ln -sf $PREFIX/lib/libc++.dylib $PREFIX/lib/libpython$PY_VER.dylib
export SKBUILD_CONFIGURE_OPTIONS=$(echo $CMAKE_ARGS | sed -e 's/\-DCMAKE_INSTALL_PREFIX\=[^ ]* //g')


{{ PYTHON }} -m pip install . -vvv
