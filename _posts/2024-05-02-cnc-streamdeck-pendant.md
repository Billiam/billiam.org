---
layout: post
title: CNC Streamdeck pendant for cncjs
date: 2024-05-01 16:30 -05:00
comments: false
share: false
tags: [cnc, cncjs, streamdeck]
---

I've shared this project in a few places, but like many other projects, I've neglected to add it to this blog.

I'm currently using CNCjs with my GRBL-based CNC, and while there are some [really](https://wiki.printnc.info/en/grbl/jog2k-controller-pendant) [nice](https://github.com/nickshl/SmartPendant) pendants out there for 32-bit grblHAL boards, the options for physical devices and interfaces for older 8 bit boards like mine, with CNCjs, are very limited.

Previous to this, I was using another pendant I put together, [cncjs-pendant-keyboardreader](https://github.com/Billiam/cncjs-pendant-keyboardreader), using a wireless keyboard.

This supported smooth jogging, and a handful of macros and preset actions, but with no visual feedback, it was difficult
to remember all of the commands and shortcuts.

I found that if I hadn't used the machine in a while, I completely forgot which keys did what. Was it control or alt for faster jogging? How do you dismiss notifications or unpause a job? And so on.

I set out to create a more usable web interface for touch devices, with the intention of also supporting a physical [Streamdeck](https://www.elgato.com/us/en/p/stream-deck-mk2-black).

The Streamdeck is interesting. At its heart, it's a single, self-contained LCD touchscreen, with a clever approach to physical buttons. The buttons themselves are transparent, with a membrane that runs along the outside edge of the button to activate the screen when pressed, giving the illusion of multiple discrete displays.

Being self contained, you can send images in jpeg format to the device to populate the display, instead of treating it as an external monitor. This is great for my use, since I can continue to use a headless Raspberry Pi for performance.

The result is the (creatively named) [cncjs-pendant-streamdeck](https://billiam.github.io/cncjs-pendant-streamdeck), an obsessively configurable frontend for CNCjs with these goals in mind. The included configuration is for a 3x5 Streamdeck, but it supports both the mini (2x3) and XL (4x8). I have not tested it with newer devices with secondary display areas, since I don't own one.

{% include figure.html url="images/post/2024/streamdeck/streamdeck.jpg" description="Streamdeck running cncjs-pendant-streamdeck" %}

Out of the box, it supports:

* Multi-axis [smooth](https://www.billiam.org/2022/05/30/grbl-smooth-jogging) or incremental jogging. The web interface supports multitouch, so two (or more) jog direction buttons can be used at the same time.
* Multiple pages
* Templated text to display CNC state, like current position
* Conditional button display/disabling
* Custom images/colors
* Execute macros (ex: for probing) and cncjs custom commands
* Execute actions on press, release, or button hold
* Display and manage alarms, holds, and pause events
* Job selection from the CNCjs watch folder
* Numeric input
* (Animated) gcode rendering and thumbnails

It can be used with or without a physical Streamdeck, with nice, large buttons for use on a phone or tablet.

{% include youtube.html id="frGhGimE0ME" %}

{% include figure.html url="images/post/2024/streamdeck/web.gif" description="Web view of the cncjs-pendant-streamdeck interface" %}

From a development perspective, the project is built as a [Vue](https://vuejs.org/) application, with a separate nodejs renderering pipeline for the Streamdeck output, and a handful of adapters to abstract the differences between the Node and Web display. This allows all of the business logic (and configuration) to be shared between the two display types.

Ideally, I'd love to build a visual configurator to generate the config file, but honestly there hasn't really been enough interest to warrant the effort.

That said, the project is extensively documented, and I've published the [cncjs-pendant-streamdeck-validator](https://github.com/Billiam/cncjs-pendant-streamdeck-validator) package, which can be used from the commandline, in a javascript project, or you can use the [schema directly](https://github.com/Billiam/cncjs-pendant-streamdeck-validator/blob/main/src/lib/config.schema.json), so there should be enough there for somebody to build that tool if desired.
