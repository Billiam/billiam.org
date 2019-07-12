---
layout: post
title: 'Sherbet: an ergonomic gaming keypad'
date: 2019-05-29 21:02:40
excerpt: Designing, printing, and building a one-handed gaming keypad
comments: false
share: false
tags: [3d-printing, keypad]
---


Some time after it was discontinued, my [Logitech G13]('/2017/10/12/customizing-logitech-g13') stopped working and I decided to design a replacement.

## Design

Like the G13, I wanted an analog thumb joystick, but also wanted to incorporate some ergonomic improvements from other keyboard designs, such as the [Dactyl keyboard](https://github.com/adereth/dactyl-keyboard), [Dactyl Manuform](https://github.com/abstracthat/dactyl-manuform), [Kinesis Advantage](https://kinesis-ergo.com/shop/advantage2/), and the [Ergodox](https://www.ergodox.io/). Namely, column-staggered keys, height offsets, column curvature, and a more comfortable overall tilt.

I chose low-profile keyboard switches (linear Kailh Choc switches from NovelKeys) to reduce the overall required height, in part because my desk sits higher than a comfortable typing height, with a large tray below. I have about four inches of available space between the tray and the underside of the desk top for both the keyboard and my hand. If that space isn't an issue, I'd strongly recommend a more compatible switch, as the keycap variety available for these ones are extremely limited.
I'd also recommend starting with the Dactyl or Dactyl-Manuform above, since designing this took way more time and effort than I could have guessed.

I started by modeling the keys themselves based on Kailh's specs for the switches before I'd received them, then tried to find a comfortable column curve, and printed some tests, then printed a few more to test column offsets. Here's what I ended up with.

{% include figure.html url="images/post/2019/keypad/design-radius-tests.jpg" description="Testing column radiuses... radii" %}

{% include figure.html url="images/post/2019/keypad/design-height-tests.jpg" description="Testing layout and column height" %}

{% include figure.html url="images/post/2019/keypad/design-34.png" description="Key design, 3/4 view" %}
{% include figure.html url="images/post/2019/keypad/design-top.png" description="Top, showing column stagger" %}
{% include figure.html url="images/post/2019/keypad/design-front.png" description="Front, showing column offsets" %}

After deciding on a layout, I started by designing out the switch sockets that will make up the main support plate.

{% include figure.html url="images/post/2019/keypad/design-sockets.png" description="Model of key plate" %}

{% include figure.html url="images/post/2019/keypad/tests-plate-supports.jpg" description="First 3D print, after removing and cleaning up the supports" %}
{% include figure.html url="images/post/2019/keypad/tests-plate-switches.jpg" description="Print showing switches" %}
{% include figure.html url="images/post/2019/keypad/tests-plate-caps.jpg" description="After adding key caps" %}

I tried a few different tenting angles, and settled on about 20 degrees. Again, this is partially to allow for clearance above the keyboard. I would have liked a steeper angle for comfort, but this is still an improvement over the (flat) G13, and my current ergonomic keyboard. The tent angle was originally parameter-driven in Fusion 360, allowing it to be changed while the rest of the design adjusted correctly around it. As the design became more complex, this parameter stopped really being configurable without breaking other features.

{% include figure.html url="images/post/2019/keypad/tests-tent.jpg" description="Previous plate with printed base to test tenting angles" %}

### Wrist Rest

Next, I started on what would be the wrist rest. I wanted a comfortable rest well suited to my hand, and planned to make it molded and contoured. I built this in Sculpey very loosely, then used a [photogrammetry](https://en.wikipedia.org/wiki/Photogrammetry) package called [Meshroom](https://alicevision.github.io/) (and a bunch of photographs) to generate a 3d model, and scaled it up to match the original.

{% include figure.html url="images/post/2019/keypad/wrist-sculpey.jpg" description="Very rough wrist rest made out of Sculpey" %}

{% include figure.html url="images/post/2019/keypad/photogrammetry.gif" description="Take lots of photos" %}

{% include figure.html url="images/post/2019/keypad/wrist-scanned.png" description="Wrist rest model with texture map from Meshroom" %}

{% include figure.html url="images/post/2019/keypad/wrist-imported.png" description="Wrist rest model imported into Fusion 360" %}

Next, I basically traced the main contours of the model to smooth it out and define the footprint I wanted

{% include figure.html url="images/post/2019/keypad/wrist-traced.png" description="Scanned model with surface model overlayed" %}

{% include figure.html url="images/post/2019/keypad/wrist-printed.jpg" description="Sculpey model next to simplified, printed version" %}

While this process was fun, and the result was comfortable, I found that the contours got in the way when my hand moved around while typing, so later designs are all plain and flat. Oh well.


### Case

I started working on the overall case next, which proved to be the most challenging part. I've still pretty new to CAD, and haven't done anything this complex before. Trying to find ways to describe compound curves, and the way that two surfaces should meet was really challenging, and took the longest of any part of this project (so far).

{% include figure.html url="images/post/2019/keypad/case-render-large.jpg" description="Render of case, including arduino joystick and some thumb buttons" %}

I also found some [better rendering environments](https://www.maximeroz.com/hdri) and the renders improved a bit as well.

{% include figure.html url="images/post/2019/keypad/case-render-side.jpg" description="Re-render of case" %}
{% include figure.html url="images/post/2019/keypad/case-render-34.jpg" description="Render of case, 3/4 view" %}

I printed out just the thumb area to test comfort and positioning. It's fine as-is, but the joystick module is just too bulky to be able to position where it really needs to be ergonomically.

{% include figure.html url="images/post/2019/keypad/tests-thumb.jpg" description="Printed thumb joystick and buttons" %}

I picked up a (much smaller) third-party Switch joycon controller instead, which can sit much closer to the keys with room for wiring. This connects with a (much less convenient) 5-wire 0.5mm pitch flexible flat cable. I picked up a 6 pin ffc breakout board from Amazon, but they can be found much cheaper on eBay or AliExpress.

{% include figure.html url="images/post/2019/keypad/case-joy-comparison.jpg" description="Comparison of joystick sizes" %}

{% include figure.html url="images/post/2019/keypad/tests-small-joy.jpg" description="Joycon joystick with switches" %}

{% include figure.html url="images/post/2019/keypad/case-shell-done.jpg" description="Redesigned case to use smaller joystick" %}

When the shell was done, I added supports for the electronic componenents that will live inside. For the joystick, I needed to make small cover plate that will screw into the side of the case, because I wouldn't be able to reach the normal screw mounts for it. For the [Teensy microcontroller](https://www.pjrc.com/teensy/teensyLC.html), I just made a friction fit holder, and screw mounts for that. I added some ziptie spots, and larger 4mm holes to allow the wrist rest to fasten on.

I'm also using a micro USB breakout board for the main USB connector to avoid wear or damage to the microcontroller.

{% include figure.html url="images/post/2019/keypad/case-underside.png" description="Render of case inside" %}

I think this whole design phase took about a month total. I won't hazard a guess at the number of hours spent on it, but... "many".

## Print

After so much time spent on design and testing, the final prints for this were relatively fast and uneventful.

{% include figure.html url="images/post/2019/keypad/print-bed.jpg" description="Printed at 0.2mm on a Maker Select Plus. Took about 15 hours" %}
{% include figure.html url="images/post/2019/keypad/print-supports.jpg" description="Postprocessing: Removing supports and cleanup. Sustained only minor injuries" %}

{% include figure.html url="images/post/2019/keypad/print-electronics.jpg" description="Underside of printed case with electronics mounted" %}

I printed the case lid (also in white) without painting, and attached some adhesive cork to the bottom. I'll be using m3 threaded heat set inserts to fix the cover to the base.

{% include figure.html url="images/post/2019/keypad/case-cork.jpg" description="Lid/cover with non-slip cork attached" %}

## Paint

I tried a few color schemes in the modeling environment, and ended up with something like this. Color options are a bit limited, because the key caps only come in black and an off white I didn't like for this.

{% include figure.html url="images/post/2019/keypad/paint-mockup.jpg" description="Paint mock up with masked stripe" %}

To finish, I first sanded with 220 grit sandpaper to know down the layer lines and surface problems, and then sprayed with a filler primer.

{% include figure.html url="images/post/2019/keypad/paint-primer.jpg" description="After first coat of primer" %}

After priming, I used Bondo glazing putty, sanded (220 and 600 grit), primer, then putty and sanding again.

{% include figure.html url="images/post/2019/keypad/paint-filler.jpg" description="After two passes of primer and glazing putty, and lots of sanding" %}

{% include figure.html url="images/post/2019/keypad/paint-primer-white.jpg" description="Primed white again" %}

I masked off a stripe using thin vinyl tape, and airbrushed with Testor's airbrush pink.

{% include figure.html url="images/post/2019/keypad/paint-stripe.jpg" description="Case, with the last of the paint" %}

After painting, I sprayed on 4 or 5 layers of gloss coat, then sanded a bunch of it back out with 1200 grit sandpaper to remove dust, fuzz, and bugs, then sprayed again.

Looks nice, but there's a lot of orange peel, and speckling from oversprayed clear coat.
I did a very light scuff sand with 1200 grit in the worst areas, then buffed with rubbing compound followed by polishing compound.

{% include figure.html url="images/post/2019/keypad/paint-polish.jpg" description="Case: After clearcoat, after sanding, after polishing" %}

## Assembly

I added homing bumps by embedding 1.5mm ceramic bearings in the key caps. Shown in the picture is one hole, drilled slightly too large, and one a bit too small, with the bearing forced in (but no glue. Not sure whether the larger size would be better with glue, vs deforming the plastic somewhat to accomodate the bearing.

{% include figure.html url="images/post/2019/keypad/tests-homing-bump.jpg" description="Key cap with embedded bearing" %}

Once I'd run out of tasks to procrastinate with, I started on wiring, beginning with the key rows and columns. 

I couldn't find any thinner gauge wire locally, and the only solid core wire I had was 22awg, which was just too hard to bend around the column offsets in the case, and to fit into small spaces between the case walls and the switch pins. Instead, I used 28awg stranded wire from a roll of ribbon cable, stripped it in sections with self-adjusting wire strippers, and then made and tinned small loops in the stripped sections. Thinner, solid wire would have been faster and less cumbersome.

{% include figure.html url="images/post/2019/keypad/assembly-wiring.jpg" description="Key switches with columns and rows soldered up" %}

{% include figure.html url="images/post/2019/keypad/assembly-wire-ribbons.jpg" description="Rows and columns connected to ribbon cable" %}

## Software

I had initially planned to use [QMK](https://qmk.fm) as the keyboard firmware, using an as-yet [unmerged pull request designed to add joystick support](https://github.com/qmk/qmk_firmware/pull/4226). However, newer, ARM Teensy controllers (>=Teensy 3.2, Teensy LC) are not well supported by QMK. Though there are two example (single-key) keyboards which support ARM Teensys, only one is currently working. Additionally, the incoming patch does not yet support ARM controllers.

When and if that patch is merged, and ARM support is implemented, I'll finish and release the QMK setup. In the mean time, I put together an Arduino sketch instead, starting from [somebody else's work here](https://forum.pjrc.com/threads/55395-Keyboard-simple-firmware).

It has two modes, one with a standard QWERTY layout plus the joystick and a single joystick button, and the other where all of the keys are mapped to joystick buttons. This allows enough buttons to configure Steam's controller configurator, allowing the controller to be used as an XInput device with broader game support.

{% gist ec4ccf967088edef36e67010839f3dd1 %}
