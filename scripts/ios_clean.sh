#!/bin/bash

rm -rf ~/Library/Developer/Xcode/DerivedData/*
flutter clean
rm pubspec.lock
cd ios
rm -rf Pods
rm -rf .symlinks
rm Podfile.lock
pod deintegrate
flutter pub get
pod setup
pod install --repo-update
cd ..