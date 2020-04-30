---
layout: post
title: CNC workholding
date: 2020-04-29 16:23 -0500
excerpt:
comments: false
share: false
tags: [cnc]
---

After finishing [the dovetail grooves]({% post_url 2020-04-27-cnc-spoilboard %}), I started on workholding and clamps by designing and 3d printing some dovetail inserts and knobs.

## Dovetail fittings and knobs

{% include figure.html url="images/post/2020/cnc_workholding/inserts2.jpg" description="Dovetail inserts and knobs" %}

I tried a few different bolts, but settled on 40 and 50mm M5 hex bolts. Any longer, and I have trouble clearing them with my router (and extra spoilboard).

For clamping taller blocks, I can counterbore them to recess the clamping knobs into the material a bit, and this helps keep the clearance height down a bit.

{% include figure.html url="images/post/2020/cnc_workholding/counterbored.jpg" description="Clamping block with counterbored hole" %}

{% include figure.html url="images/post/2020/cnc_workholding/recessed_knob.jpg" description="Knob recessed into block surface" %}

The inserts and knobs went through a few iterations.

The inserts got a little smaller in width, so that they can slide in the dovetail grooves more easily, and a deliberately undersized nut diameter so that the bolt heads fit tightly in them, instead of being easily pressed in.

Most recently, I also made them a little bit shorter, so that I can surface the spoilboard a few times, but also to make sure that when clamping they don't press directly against whatever it is I'm clamping, causing them to slide even when clamped tightly.

These are not perfect though. With tight clamping, these get stuck in the MDF. I'm not sure if the MDF is getting deformed and snapping back when pressure is removed, or if the layer lines in the 3d print are kind of biting into the MDF surface, or if they're getting jammed by rotation.

After clamping tightly, I usually have to uncscrew the knobs, pull off the blocks or cam clamps, and then poke the inserts back into the slots with a screwdriver to free them up. I'm not sure how to solve this yet. It could be that I can change the surface of the inserts by sanding them, or slightly changing the shape, or I may be able to change the shape to add some relief so that they rotate back easily.

Maybe they should be slightly over-tapered, so that more of the holding force is applied deeper in the dovetail, rather than near the surface.

## Stop blocks

I started by just drilling 5mm holes in random bits of scrap wood. This works fine with enough lateral and downward pressure but quickly realized they work much better if they're a little taller than the material being clamped, and also have a slight 15° bevel on them to help keep the material down. Seems obvious in retrospect.

These I just cut on a table saw, and then drilled a hole roughly in the center.

## Cam clamps

These are simple spiral-shaped cam clamps that apply sideways pressure, but won't hold anything down.

I cut these from 1/2" plywood, and they work great.

{% include youtube.html id="qOtn1O4SY80" %}

{% include figure.html url="images/post/2020/cnc_workholding/cams.jpg" description="Clamps all cut out and drilled" %}

### Round cam

The above picture also has my first pass at a round cam clamp, cut from scrap redwood. This one is one inch thick and has the same 15° bevel on it to help hold work down. Before cutting it, I drilled two holes through it surface and held it in place with flange nuts rather than clamping.

This was roughed with a 1/4" square endmill, and then finished with fine passes with a 1/4" ball endmill. This could have been made much easier and faster without the CNC, using a bandsaw and an a tall bevel bit, but I don't have either.

Here's what it looks like in use.

{% include figure.html url="images/post/2020/cnc_workholding/redwood_cam.jpg" description="Spiral cam holding a block" %}

I refined the shape a bit, so that it has a smooth spiral from beginning to end, instead of having some lost space around the perimeter that can't be used for clamping, and cut a new one from 1" plywood (really two 1/2" sheets sandwiched together).

Instead of bolting through it, I modeled tabs for it manually in Fusion.

{% include figure.html url="images/post/2020/cnc_workholding/plywood_cam.jpg" description="Round cam after routing" %}

{% include figure.html url="images/post/2020/cnc_workholding/plywood_cam_removed.jpg" description="After removing from the sheet" %}

## Low profile clamp

One issue I'm having with these styles of clamp is that they have to be taller than whatever I'm working on to have any holding power (at least downwards).

I'm experimenting with low profile sliding clamps, and just finished designing and assembling this one (a rebuild of [one I found on thingiverse](https://www.thingiverse.com/thing:2910117) to fit my hardware).

{% include figure.html url="images/post/2020/cnc_workholding/low_profile.jpg" description="Low profile clamp, printed" %}

{% include figure.html url="images/post/2020/cnc_workholding/low_profile_on_table.jpg" description="Clamp in use" %}

This uses a M5 18mm socket screw (I'm really using a 16mm but it's a little short) for the sliding part, a M5 16mm screw to hold it to the dovetail insert, and a couple of 5x25mm steel dowel pins.

It holds fairly well, but I haven't tested it thoroughly yet. It may not be better than any other side clamp, especially since the "teeth" are quite dull.

## Files and downloads:

* [Dovetail inserts and knobs](https://www.prusaprinters.org/prints/30046-dovetail-cnc-workholding-hardware)
* [Cam and circular clamps](https://www.prusaprinters.org/prints/30837-cnc-cam-clamps)
* [Low profile clamp](https://www.prusaprinters.org/prints/30836-low-profile-workholding-clamp)
