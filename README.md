# Simple FPS camera

[![img](https://awesome.re/mentioned-badge.svg)](https://github.com/godotengine/awesome-godot)
![img](https://img.shields.io/github/license/tavurth/godot-simple-fps-camera.svg)
![img](https://img.shields.io/github/repo-size/tavurth/godot-simple-fps-camera.svg)
![img](https://img.shields.io/github/languages/code-size/tavurth/godot-simple-fps-camera.svg)

## [Web Demo](https://tavurth.itch.io/godot-simple-fps-camera) ←←←←

<img width="1024" alt="Screenshot 2022-02-07 at 00 40 33" src="https://user-images.githubusercontent.com/100964/152702489-7aa8abcf-82bc-448e-b9c3-baf253622e63.png">

https://user-images.githubusercontent.com/100964/152702852-34be1111-a800-4595-a8aa-71e4d976afde.mp4


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

### Light cookies

I've attached a flashlight to the camera, but I'd like to get a [light cookie effect](https://doy2mn9upadnk.cloudfront.net/uploads/default/optimized/4X/e/9/4/e94c2386fdab91f9c3fe285fc45b314d860286fe_2_1024x797.jpeg), so I added a second light a little bit behind the first one.

In the space between the two lights I added a `Sprite3D` node with my light cookie texture, and then set the visual instance to `20` while disabling rendering of the `20` layer in my camera.

This causes the light cookie to appear, but also for it to have a different shadow color than the world shadow, which is nice because it has a blended look.
