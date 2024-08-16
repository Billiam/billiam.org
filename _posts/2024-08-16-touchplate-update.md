---
layout: post
title: CNC touchplate update
date: 2024-08-16 12:41 -0500
excerpt:
comments: false
share: false
tags: [cnc]
---

I'm currently working on a number of updates to my CNC machine, including upgrading to a spindle, but the post about it was getting long, so I'm breaking it into smaller chunks.

The first is this update to the touch plate, as I've had a couple of issues with the current one.

The first is that the magnetic probe is kind of a pain to make, as it required soldering directly to a magnet, while moving quickly enough to minimize loss of magnetism.

The second and biggest one is that, for the wire to reach from the control box to the working area, it has to be long and unruly.

### New probe

For the first issue, I've changed to a much easier to assemble design requiring:

* a magnet with an m3 countersunk hole
* an m3 flathead screw
* a ring connector
* an acorn nut to make it look fancy.

Now assembly just requires screwing the parts together and crimping or soldering the ring connector to the probe wire.

{% include figure.html url="images/post/2024/touchplate-update/probe-assembled.jpg" description="Assembled probe" alt="A magnetic probe with no wire attached" %}

The (temporary) screw shown here has a black oxide coating making it non-conductive. This will be replaced with a steel screw before use.

### New wiring

For the wire issue, I've replaced the bulk of the wire with a relatively long (6 foot) retractable audio cable that I found, and spliced that to a short length of flexible wire for the probe and touch plate.

The flat audio cable in the cord retractor uses relatively fragile, enamel coated wire, which requires burning the coating off before it car be soldered. I designed and printed [a cable strain relief](https://www.printables.com/model/975980-flat-audio-wire-splice-strain-relief) for this end to help keep them stable when pulling the cable around.

{% include figure.html url="images/post/2024/touchplate-update/strain-relief.jpg" description="Strain relief with soldered connections" alt="A small (40mm) black plastic 3d-printed housing and lid, with interlocking pegs to keep the lid in place when closed. The input side of the housing has a thin serpentine channel containing a flat audio cable, the other output side has two wider channels for individual stranded wires. In between the housing has two larger separated channels where the input and output wires have been individually soldered together." %}

Another way to solve the wire issue would be to run a probe wire and convenient output plug through the drag chain to the spindle. Then, I'd only ever need a relatively short wire to reach the workpiece.

{% include figure.html url="images/post/2024/touchplate-update/cable-retractor.jpg" description="The finished product" alt="A cable retractor connected to a black box on one side, and a magnetic probe and touch plate on the other, with a black strain relief between them." %}

I also made a new touchplate holder that uses a bolt to give the probe somewhere to stick when not in use. You can find it, and the original probe and mount design here: <https://www.printables.com/model/30072-millright-mega-v-touch-plate-holder-and-magnetic-p>

{% include figure.html url="images/post/2024/touchplate-update/plate-holder.jpg" description="3d printed touchplate holder" alt="A black plastic shell that the bottom of the touch plate slides into. The probe attaches magnetically to a bolt passing through the housing" %}
