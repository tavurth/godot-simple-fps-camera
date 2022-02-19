# Simple FPS camera

[![img](https://awesome.re/mentioned-badge.svg)](https://github.com/godotengine/awesome-godot)
![img](https://img.shields.io/github/license/tavurth/godot-simple-fps-camera.svg)
![img](https://img.shields.io/github/repo-size/tavurth/godot-simple-fps-camera.svg)
![img](https://img.shields.io/github/languages/code-size/tavurth/godot-simple-fps-camera.svg)

## [Web Demo](https://tavurth.itch.io/godot-simple-fps-camera) ←←←←

<img width="1024" alt="Screenshot 2022-02-07 at 00 40 33" src="https://user-images.githubusercontent.com/100964/152702489-7aa8abcf-82bc-448e-b9c3-baf253622e63.png">

<img width="1024" alt="Screenshot 2022-02-09 at 18 50 31" src="https://user-images.githubusercontent.com/100964/153238017-46e08fa0-fc01-40b6-bdaf-2d98ade3cb6a.png">

https://user-images.githubusercontent.com/100964/153240320-7fad22ed-8840-4f54-9ee1-8af7421e9767.mp4

A FPS camera made for the purposes of teaching others GDscript and godot.

The purpose of this demo is to show how to create a camera in a simple way.
You are free to use, modify and merge this in whatever way you like.

<a id="orgcc1c9d3"></a>

## Requirements:

- [Godot](https://godotengine.org) 3.x

<a id="orgb9a9226"></a>

## Ideas

### Camera rotation

The main idea I'd like to represent here is splitting the X rotation and Y rotation.

We use a parent node "Player", and a child node "Camera". The parent node takes care of the left and
right rotation, while the child node takes care of vertical rotation.

If we simply try to rotate the child node in first the X and then the Y directions
we'd end up with a sort of flight-simulator camera, where we can roll left and right rather
than turning left and right.

### Player model

The player model was loaded as a `.glb` file with animations. The animations were downloaded from [mixamo.com](mixamo.com).

Then an AnimationTree was created and you can explore the two AnimationBlend1D which are used for moving and strafing.

<a href="https://www.buymeacoffee.com/tavurth" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
