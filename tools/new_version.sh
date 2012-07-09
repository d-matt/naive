#!/bin/bash
# Publish a new version of the naive theme.
#
# Usage
# -----
#
# In the naive dir, do :
# ./tools/new_version.sh TAG
# where TAG is the version to be

if [ $# -eq 0 ]; then
echo "Usage: $0 version"
    exit 1
fi

VERSION="$1"

#Check Changelog
#Add the new version
sed -i "s/Version: .*/Version: $VERSION/" themeconf.inc.php
git commit -m "new version $VERSION" themeconf.inc.php
echo "New tag for version $VERSION"
git tag -a $VERSION -m "version $VERSION"

echo "Pushing to github"
git push
git push --tags

git archive --format=zip --prefix=naive/ $VERSION > /tmp/naive-$VERSION.zip
echo "zip archive available: /tmp/naive-$VERSION.zip"

#removing extra files from the package
zip /tmp/naive-$VERSION.zip -d naive/tools/\*
zip /tmp/naive-$VERSION.zip -d naive/font/make_font.py
zip /tmp/naive-$VERSION.zip -d naive/font/vector/\*
