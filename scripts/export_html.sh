#!/usr/bin/env bash
set -euo pipefail

NAME=godot-simple-fps-camera
DIRECTORY=~/src/$NAME

/Applications/Godot.app/Contents/MacOS/Godot $@ --no-window --export "HTML5" $DIRECTORY/build/$NAME.html
mv build/$NAME.html build/index.html

cd build
zip \
    HTML5_$NAME.zip \
    $NAME.apple-touch-icon.png \
    $NAME.audio.worklet.js \
    index.html \
    $NAME.icon.png \
    $NAME.js \
    $NAME.pck \
    $NAME.png \
    $NAME.wasm ||
    true

rm -rf \
    $NAME.apple-touch-icon.png \
    $NAME.audio.worklet.js \
    index.html \
    $NAME.icon.png \
    $NAME.js \
    $NAME.pck \
    $NAME.png \
    $NAME.wasm

butler push HTML5_$NAME.zip tavurth/$NAME:html5
cd ..
