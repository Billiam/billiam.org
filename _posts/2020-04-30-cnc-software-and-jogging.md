---
layout: post
title: CNC software and jogging
date: 2020-04-30 17:47 -0500
excerpt:
comments: false
share: false
tags: [cnc]
---

To drive the CNC, I'm currently using [CNCjs](https://cnc.js.org), installed on a Raspberry Pi 3b+.

The system is currently headless, because I don't have a dedicated laptop for it, and my CNC lives in my garage where it's too cold to leave an LCD screen.

CNCjs is fine, and a good fit for this use case, but pretty clunky on a small screen, and lacks some of the features available in other gcode senders, like autoleveling, basic gcode generation for simple operations like facing, cancelable jogging, angle deviation probing...

I find jogging via the default web interface really uncomfortable. It's very easy to hit the wrong button among the tightly packed buttons, and do something bad, like rapid moving to zero when things are in the way. I'd like to say I only did this once, but...

The other issue with jogging like this, particularly with a small screen is that button presses may be queued, and delayed, and then may execute in series unexpectedly. There's also no real way to quickly cancel dangerous moves.

I saved myself some pain by enabling soft limits in GRBL, but I need to tune these better.

For small screen use, there's a much better interface at [https://github.com/cncjs/cncjs-shopfloor-tablet](cncjs-shopfloor-tablet), which I used for a little bit. It too has some issues; It's much better suited to a tablet display than a phone, and you cannot run macros from it.

I started down the path of making the interface more responsive, but stopped using it before finishing.

I also ran into [this issue](https://github.com/cncjs/cncjs-shopfloor-tablet/issues/20#issuecomment-612715384) which drove me crazy for a few days before discovering that, if I left the interface open on my phone, and the phone went to sleep, whatever job was running would halt.

## File uploading

To transfer gcode from my machine to the raspberry pi, I'm currently using <https://github.com/efeiefei/node-file-manager>
to upload the gcode to the CNCjs watch folder. It would have been easy to set up network shares for this also.

## Probing and other macros

I'm using a few macros right now.

One for XYZ probing using a touchplate, as well as two for a [bitsetter](https://www.youtube.com/watch?v=I97XwLBmyuc) are from here: <https://github.com/cncjs/CNCjs-Macros>

I duplicated the XYZ probe one and deleted a bunch of it to act as a Z-only probe, since I've been
setting the Z-zero to my spoilboard away from my material, when I do full through cuts.

I'm also using one from this page to jog around the X/Y perimeter of loaded gcode:
<https://github.com/cncjs/cncjs/wiki/User-Guide>

## Jogging improvements

I dug up a wireless keyboard I'd forgotten about, the [Logitech K400+](https://www.logitech.com/en-us/product/wireless-touch-keyboard-k400-plus).

I found this module for CNCjs which allows jogging with a wireless keyboard: <https://github.com/cncjs/cncjs-pendant-keyboard>, but I don't have that specific one,
and some of its special key mapping didn't translate to mine.

I also found _this_ one which supports smooth jogging while holding a key, as well as grbl jog cancelling.
<https://github.com/jheyman/shapeoko/tree/master/cncjs-pendant-keyboardreader>

This one is more generic, but can't work with my headless setup, as it requires the running application
to maintain focus.

I've forked it here: <https://github.com/Billiam/cncjs-pendant-keyboardreader>

It now uses `node-hid` like `cncjs-pendant-keyboard` so it doesn't require focus,
and works with the Logitech K400 plus.

I have it set up to jog on X and Y with the arrow keys, Z axis via `I` and `K` in 0.1mm increments.

`Ctrl + direction` will move 10mm at a time.
`Alt + direction` will move 1mm at a time.
`Shift + direction` will move continuously in that direction until shift is released.

`Ctrl + H` will home the machine.

I'm thinking of adding probe commands, but I can't unpause dialogs I can't see, so I'm not sure how safe that would end up being.

With an easier setup for jogging, I'm just using the default CNCjs interface on my phone to start jobs and run macros (but that's about it right now).

Eventually, I'd like to replace the keyboard with something more specialized, but most of the commercial ones I've seen aren't compatible.
