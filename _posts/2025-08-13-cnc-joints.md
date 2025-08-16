---
title: CNC corner joinery comparison
tags: [cnc]
layout: post
date: 2025-08-13 20:10:00 -0500
comments: false
share: false
---
I've been experimenting with woodworking joinery that can be cut flat (without vertical workholding) on a CNC. There are lots of examples of these joints online, and I don't have any new ones to share, _but I did_ model and CAM a bunch of them to compare relative glue surface area and internal voids. Maybe that information is helpful to somebody.

{% include _toc.html %}

For these tests, I modeled two 90-degree boards, 8 inches wide by ¾\" thick. These joints are primarily practical and non-decorative, and I've tried to keep the same or similar proportions for tongues.

The machining time is very subjective, but I'm estimating based on consumer grade (read: not stiff) CNC routers, using ¼\" and ⅛\" endmills. Times assume that boards are already planed to thickness and cut to length, and use a roughing pass followed by a lighter finishing pass.

For the roughing pass, I'm simulating with a 2-flute endmill, 3mm stepdown, 0.14mm feed per tooth at 18,000 RPM. For the ⅛\" tool, where needed, I'm using 2mm stepdown, 0.1mm feed per tooth at 20,000 RPM.

For alignment, I'm counting the number of directions that the joint _can't_ move when assembled, where higher is (probably)
better. A butt joint is held in place in one direction. An open-sided rabbet joint is held in place in two directions.
A dovetail joint is held in place in five directions.

## Butt joint

{% include figure.html url="images/post/2025/joint/buttr.jpg" %}

The most basic joint is a simple butt joint and supplies the baseline for
gluable area. In this case, 6 square inches. It provides no help in assembly, since the boards can slide past each other or slide sideways. I'm going to call those axial and radial directions, but I think I'm using the wrong vocabulary here. Oh well!

Glue surface area:
: 6 in²

CAD effort:
: None/minimal

Machining time:
: 0

Tool changes: 
: 0

Void volume: 
: 0

Alignment directions:
: 1

## Mitered joint

{% include figure.html url="images/post/2025/joint/miterr.jpg" %}

It's easier to cut this on a table saw, but could be cut in multiple passes with a chamfering tool on a CNC as well. It has no voids, and like the butt joint, does not help with assembly.

Glue surface area: 
: 8.49 in²

CAD effort:
: Minimal

Machining time:
: 0

Tool changes:
: 0

Void volume:
: 0

Alignment directions:
: 1

## Stepped "miter" joint

{% include figure.html url="images/post/2025/joint/step-miterr.jpg" %}

This joint is constructed with repeated, successively deeper steps along the joint edge. It has no voids, improves the glue surface area, and helps a little with assembly depending on step size.

Glue surface area:
: 11.4 in²

CAD effort:
: Medium

Machining time:
: 5m56s

Tool changes:
: 0

Void volume:
: 0

Alignment directions:
: 2

## Rabbet joint

{% include figure.html url="images/post/2025/joint/dador.jpg" %}

This joint is another one that can easily be cut on the table saw or router table. It provides a little more glue surface, and a little help with assembly.

Glue surface area:
: 9 in²

CAD effort:
: Minimal

Machining time:
: 2m11s

Tool changes:
: 0

Void volume:
: 0

Alignment directions:
: 2

## Tongue housing joint

{% include figure.html url="images/post/2025/joint/groovef.jpg" %}

This joint too can be cut on a table saw with a dado stack, or on a router table, but is also easy with a CNC. It does not prevent sliding but does otherwise lock the pieces together, and provides twice the glue surface of a butt joint. To
prevent sliding and improve alignment, the tongue and groove can stop before the board edge and appropriately dogboned.

Glue surface area:
: 12 in²

CAD effort:
: Minimal

Machining time:
: 2m26s

Tool changes:
: 0

Void volume:
: 0

Alignment directions:
: 3

## Hammer tenon

{% include figure.html url="images/post/2025/joint/hammerf.jpg" %}

The hammer tenon can be cut flat and provides axial and radial assembly help. It's a bit more complicated to design, and requires adding dogbones, which creates some void spaces in the joint. Alignment and surface contact can be improved
by using a smaller tool to reduce the dogbone size.

Glue surface area:
: 6.43 in²

CAD effort:
: High

Machining time:
: 6m13s

Tool changes:
: 0

Void volume:
: 0.367 in³

Alignment directions:
: 5

## Finger tenons

{% include figure.html url="images/post/2025/joint/fingerf.jpg" %}

This design uses thin tenons about the width of the router bit, so a single dogbone suffices on each slot.

Glue surface area:
: 16.31 in²

CAD effort:
: Medium

Machining time:
: 4m19s

Tool changes:
: 0

Void volume:
: 0.53 in³

Alignment directions:
: 3

## Blind finger tenons

<div class="image-row">

{% include figure.html url="images/post/2025/joint/finger-blindf.jpg" %}

{% include figure.html url="images/post/2025/joint/finger-blindr.jpg" %}

</div>

This is functionally the same as the finger tenon design but retains ⅛\" of wood on the outside of the corner to hide the joint, though the dogbones are still visible from the inside.
 This also increases the glue area and reduces the internal voids a little.

Glue surface area:
: 17.02 in²

CAD effort:
: Medium

Machining time:
: 3m21s

Tool changes:
: 0

Void volume:
: 0.45 in³

Alignment directions:
: 4

## Mortise and through tenon

{% include figure.html url="images/post/2025/joint/mortisef.jpg" %}

This uses half-thickness tenons that pass through the opposite board, and requires dogbone relief cuts
on both the mortises and tenons. Glue surface area is not great, but it provides good assembly support.

Glue surface area:
: 7.81 in²

CAD effort:
: Medium

Machining time:
: 8m55s

Tool changes:
: 0

Void volume:
: 0.27 in³

Alignment directions:
: 3

## Mortise and hidden tenon

<div class="image-row">

{% include figure.html url="images/post/2025/joint/mortise-blindf.jpg" %}

{% include figure.html url="images/post/2025/joint/mortise-blindr.jpg" %}

</div>

The tenons for this joint stop ⅛\" of an inch before exiting the opposite board, and uses parallel dogbones to hide the joint from both the inside and outside of the corner, and also increases the glue surface. These dogbones allow the joint to slide a bit though.

Glue surface area:
: 10.29 in²

CAD effort:
: Medium

Machining time:
: 8m59s

Tool changes:
: 0

Void volume:
: 0.27 in³

Alignment directions:
: 3

## Box joints

The following box joints are all similar but use different methods for relieving the cutter radius in inside corners, resulting in differences in void space, gluing area, CAD effort and manufacturing time.

### Basic box joint

{% include figure.html url="images/post/2025/joint/boxf.jpg" %}

This box joint use basic ¼\" dogbones for inside corners. It provides good assembly support, but lower glue surface area due to the large dogbones cutouts.

Glue surface area:
: 6.44 in²

CAD effort:
: Low

Machining time:
: 4m47s

Tool changes:
: 0

Void volume:
: 0.09 in³

Alignment directions:
: 4

### Box joint with smaller dogbones

{% include figure.html url="images/post/2025/joint/box-smallf.jpg" %}

By using a smaller tool for the dogbones, the glue surface can be increased, and the voids decreased at the cost of machining time and one tool change.

Glue surface area:
: 8.14 in²

CAD effort:
: Low

Machining time:
: 5m24s

Tool changes:
: 1

Void volume:
: 0.02 in³

Alignment directions:
: 4

### Box joint with smaller perpendicular dogbones

{% include figure.html url="images/post/2025/joint/box-small-parallelf.jpg" %}

This joint uses dogbones that are perpendicular to the ends of the tenons, which will hide them from the inside of the joint (but still visible on the outside). This increases the overall void volume, and decreases glue surface below that of the original butt joint.

Glue surface area:
: 8.66 in²

CAD effort:
: Low

Machining time:
: 6m14s

Tool changes:
: 1

Void volume:
: 0.06 in³

Alignment directions:
: 4

### Box joint with rabbets

<div class="image-row">

{% include figure.html url="images/post/2025/joint/box-relieff.jpg" %}

{% include figure.html url="images/post/2025/joint/box-reliefr.jpg" %}

</div>

Instead of dogbones, this design uses rabbets at the corners of the tenons. It takes more work in CAD, as the box tenons need to be created in addition to the rabbets.

Glue surface area:
: 7.56 in²

CAD effort:
: High

Machining time:
: 5m43s

Tool changes:
: 0

Void volume:
: 0.13 in³

Alignment directions:
: 4

### Box joint with small rabbets

<div class="image-row">

{% include figure.html url="images/post/2025/joint/box-relief-smallf.jpg" %}

{% include figure.html url="images/post/2025/joint/box-relief-smallr.jpg" %}

</div>

With a tool change, the same design can reduce the rabbet size to moderately increase glue surface, and decrease void volume.

Glue surface area:
: 8.69 in²

CAD effort:
: High

Machining time:
: 5m22s

Tool changes:
: 1

Void volume:
: 0.03 in³

Alignment directions:
: 4

### Box joint with rabbets and hidden tenons

<div class="image-row">

{% include figure.html url="images/post/2025/joint/box-relief-blindf.jpg" %}

{% include figure.html url="images/post/2025/joint/box-relief-blindr.jpg" %}

</div>

By adding ⅛\" of material on the outside corner of both boards, the joint can be hidden from the inside out, and the glue area can be increased significantly.

Glue surface area:
: 11.46 in²

CAD effort:
: High

Machining time:
: 5m01s

Tool changes:
: 0

Void volume:
: 0.11 in³

Alignment directions:
: 4

### Box joint with small rabbets and hidden tenons

<div class="image-row">

{% include figure.html url="images/post/2025/joint/box-relief-small-blindf.jpg" %}

{% include figure.html url="images/post/2025/joint/box-relief-small-blindr.jpg" %}

</div>

This joint uses a smaller ⅛\" tool for inside corners and the rabbets to increase glue surface and decrease void volume, at the cost of manufacturing time and a tool change

Glue surface area:
: 12.62 in²

CAD effort:
: High

Machining time:
: 4m49s

Tool changes:
: 1

Void volume:
: 0.03 in³

Alignment directions:
: 4

### Box joint with half rounded tenons

<div class="image-row">

{% include figure.html url="images/post/2025/joint/box-roundf.jpg" %}

{% include figure.html url="images/post/2025/joint/box-roundr.jpg" %}

</div>

This joint uses contoured, half rounded tenons to compensate for the inside radius on the opposite side.
It requires significantly more machining time since the tenon edges must be 3d surfaced, but has good glue contact area and low void volume.

Glue surface area:
: 8.89 in²

CAD effort:
: Moderate

Machining time:
: 7m37s

Tool changes:
: 0

Void volume:
: 0.04 in³

Alignment directions:
: 4

### Box joint with smaller rounding on tenons

{% include figure.html url="images/post/2025/joint/box-round-smallf.jpg" %}

This joint uses the same rounded tenons but uses a ⅛\" tool to reduce the void area and tighten the inside corners.

Glue surface area:
: 9.54 in²

CAD effort:
: Moderate

Machining time:
: 6m41s

Tool changes:
: 0

Void volume:
: 0.01 in³

Alignment directions:
: 4

## Summary

For my needs, I'll probably be using a mix of the [tongue housing joint](#tongue-housing-joint) for quick, easy cadding and glue area, and using the [rabbeted box joint](#box-joint-with-rabbets) or [with hidden tenons](#box-joint-with-rabbets-and-hidden-tenons) if I want more self alignment.

<div class="detail-table" markdown="block">

|Name|Glue Surface|Cad effort|Tool Changes|Machining time|Void volume|Align|
|---|---|---|---|---|---|---|---|
|[Butt](#butt-joint)|6 in²|None|0|0|0|1|
|[Mitered](#mitered-joint)|8.49 in²|Min|0|0|0|1|
|[Stepped](#stepped-miter-joint)|11.4 in²|Med|0|5m56s|0|2|
|[Rabbet](#rabbet-joint)|9 in²|Min|0|2m11s|0|2|
|[Tongue](#tongue-housing-joint)|12 in²|Min|0|2m26s|0|3|
|[Hammer](#hammer-tenon)|6.43 in²|High|0|6m13s|0.38 in³|5|
|[Finger](#finger-tenons)|16.31 in²|Med|0|4m19s|0.53 in³|3|
|[Blind finger](#blind-finger-tenons)|17.02 in²|Med|0|3m21s|0.45 in³|4|
|[Mortise](#mortise-and-through-tenon)|7.81 in²|Med|0|8m55s|0.27 in³|3|
|[Blind mortise](#mortise-and-hidden-tenon)|10.29 in²|Med|0|8m59s|0.27 in³|3|
|[Box](#basic-box-joint)|6.44 in²|Low|0|4m47s|0.09 in³|4|
|[Box small dogbone](#box-joint-with-smaller-dogbones)|8.14 in²|Low|1|5m24s|0.02 in³|4|
|[Perp dogbone](#box-joint-with-smaller-perpendicular-dogbones)|8.66 in²|Low|1|6m14s|0.06 in³|4|
|[Rabbet box](#box-joint-with-rabbets)|7.56 in²|High|0|5m43s|0.13 in³|4|
|[Small rabbet box](#box-joint-with-small-rabbets)|8.69 in²|High|1|5m22s|0.03 in³|4|
|[Hidden rabbet box](#box-joint-with-rabbets-and-hidden-tenons)|11.46 in²|High|0|5m01s|0.11 in³|4|
|[Small hidden rabbet box](#box-joint-with-small-rabbets-and-hidden-tenons)|12.62 in²|High|1|4m49s|0.03 in³|4|
|[Rounded box](#box-joint-with-half-rounded-tenons)|8.89 in²|Med|0|7m37s|0.04 in³|4|
|[Small rounded box](#box-joint-with-smaller-rounding-on-tenons)|9.54 in²|Med|1|6m41s|0.01 in³|4|


</div>
