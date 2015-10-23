#!/bin/bash

# Setup
export LD_LIBRARY_PATH=/usr/local/lib
echo "dash dash/sh boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
mkdir /blender_experimental

# Build OpenEXR
cd /blender_experimental
git clone https://github.com/openexr/openexr.git
cd openexr/IlmBase
/bin/bash ./bootstrap
/bin/bash ./configure
make
make install
cd ../OpenEXR
/bin/bash ./bootstrap
/bin/bash ./configure
make
make install


# Build OpenVDB
cd /blender_experimental
git clone https://github.com/thecsapprentice/openvdb.git
cd openvdb/openvdb
git checkout cycles_fixes
make lib PYTHON_VERSION= HT=/usr/local HDSO=/usr/local/lib/ BLOSC_INCL_DIR= DESTDIR=/usr/local
make install PYTHON_VERSION= HT=/usr/local HDSO=/usr/local/lib/ BLOSC_INCL_DIR= DESTDIR=/usr/local


# Build Blender
cd /blender_experimental
git clone https://github.com/thecsapprentice/blender-cycles_openvdb.git
cd blender-cycles_openvdb
git checkout openvdb
git submodule init
git submodule update
python scons/scons.py BF_QUIET=1 -j 40
