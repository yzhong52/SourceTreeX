#!/bin/bash

cp ~/Library/Application\ Support/SourceTree/actions.plist actions.plist

# `plist` has two formats: binary format and xml format.
# binary format is more compact and is used by SourceTree by default.
# However, we convert it to xml here to store in git.
plutil -convert xml1 actions.plist
