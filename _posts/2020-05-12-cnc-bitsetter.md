---
layout: post
title: CNC tool setter
date: 2020-05-12 15:20 -0500
excerpt:
comments: false
share: false
tags: [cnc, toolsetter]
---

I had some keyboard switches left over from a [previous project]({% post_url 2019-05-29-sherbet-an-ergonomic-keypad %}), and wanted
a more convenient process for changing bits during a job.

{% include figure.html url="images/post/2020/cnc_bitsetter/bitsetter.jpg" description="Bit setter mountet to wasteboard" %}
This is a simple switch, wired in parallel with my touch plate, that is used before and after changing router bits.

When changing a bit, a macro offsets the Z height by the difference between the first and second tool length, and
work can continue with the new bit.

This process is much faster than manual zeroing after changing bits, or using the touch plate. The tool can overshoot the switch's trigger
position slightly without damage, so the probe speed can be much faster than a touch plate, and it doesn't require connecting the probe clip.

Additionally, if the original zero position has been carved away by the previous job, the tool setter can still be used.

It's promising, but has some issues.

First, it has moving parts exposed to cnc dust and chips. I added a magnetic cover for it to help with that

{% include youtube.html id="mIWHAKrAU-8" %}

Second, though it's much lower profile than commercial options, it's just about flush with the surface of my wasteboard. For surfacing, when I'm cutting off the edge, I've been pulling the
cap off and taping it down. I'm planning to move it out in front of the wasteboard instead.

Third, repeatability isn't amazing (around 0.02-0.04mm) because the 3d-printed button top I'm using isn't a perfect fit on the switch,
and the switch has some play as well. I'm looking to replace it with something with less play, but haven't found the right thing yet.

3D printable files for it can be found [here](https://www.prusaprinters.org/prints/30075-cnc-tool-setter-button)
