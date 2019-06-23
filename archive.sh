#!/bin/bash

cp ~/Library/Application\ Support/SourceTree/actions.plist actions.plist
plutil -convert xml1 actions.plist
