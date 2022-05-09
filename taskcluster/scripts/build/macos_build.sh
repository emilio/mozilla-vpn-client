#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -e
set -x

. $(dirname $0)/../../../scripts/utils/commons.sh

print N "Taskcluster macOS compilation script"
print N ""

export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

print Y "Installing ruby dependencies..."
# use --user-install for permissions
gem install xcodeproj --user-install || die
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

print Y "Installing rust..."
curl https://sh.rustup.rs -sSf | sh -s -- -y || die
export PATH="$HOME/.cargo/bin:$PATH"

print Y "Installing go..."
curl -O https://dl.google.com/go/go1.17.6.darwin-amd64.tar.gz
tar -xzf go1.17.6.darwin-amd64.tar.gz
export PATH="`pwd`/go/bin:$PATH"

print Y "Installing python dependencies..."
# use --user for permissions
python3 -m pip install -r requirements.txt --user
export PYTHONIOENCODING="UTF-8"


print Y "Installing QT..."
PROJECT_HOME=`pwd`
cd ../../fetches/qt_dist || die
export QT_MACOS_BIN=`pwd`/bin
export PATH=$QT_MACOS_BIN:$PATH

cat > bin/qt.conf << EOF
[Paths]
Prefix=`pwd`
EOF
cp bin/qt.conf libexec || die
cd $PROJECT_HOME


print Y "Updating submodules..."
# should already be done by XCode cloud cloning but just to make sure
git submodule init || die
git submodule update || die

print Y "Configuring the build..."
SHORTVERSION=$(cat version.pri | grep VERSION | grep defined | cut -d= -f2 | tr -d \ )
FULLVERSION=$(echo $SHORTVERSION | cut -d. -f1).$(date +"%Y%m%d%H%M")
echo "$SHORTVERSION - $FULLVERSION"
echo "DEVELOPMENT_TEAM = 43AQ936H96" >> xcode.xconfig
echo "GROUP_ID_MACOS = group.org.mozilla.macos.Guardian" >> xcode.xconfig
echo "APP_ID_MACOS = org.mozilla.macos.FirefoxVPN" >> xcode.xconfig
echo "NETEXT_ID_MACOS = org.mozilla.macos.FirefoxVPN.network-extension" >> xcode.xconfig
echo "LOGIN_ID_MACOS = org.mozilla.macos.FirefoxVPN.login" >> xcode.xconfig
echo "GROUP_ID_IOS = group.org.mozilla.ios.Guardian" >> xcode.xconfig
echo "APP_ID_IOS = org.mozilla.ios.FirefoxVPN" >> xcode.xconfig
echo "NETEXT_ID_IOS = org.mozilla.ios.FirefoxVPN.network-extension" >> xcode.xconfig
./scripts/macos/apple_compile.sh macos || die

print Y "Compiling..."
xcodebuild build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO -project Mozilla\ VPN.xcodeproj || die

print Y "Creating the final package..."
python3 ./scripts/macos/import_pkg_resources.py || die

set
print Y "Exporting the artifact..."
mkdir -p tmp || die
cp -r Release/Mozilla\ VPN.app tmp || die
cp -r ./macos/pkg/scripts tmp || die
cp -r ./macos/pkg/Distribution tmp || die
cp -r ./macos/pkg/Resources tmp || die
cd tmp || die

artifacts_dir="$PROJECT_HOME/../../artifacts"
[[ -d "$artifacts_dir" ]] || mkdir -p $artifacts_dir
tar -czvf $artifacts_dir/MozillaVPN.tar.gz . || die
cd .. || die
rm -rf tmp || die

print G "Done!"
