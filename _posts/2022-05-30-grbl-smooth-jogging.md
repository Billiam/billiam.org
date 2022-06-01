---
layout: post
title: Grbl smooth jogging
date: 2022-05-30 16:30 -05:00
comments: false
share: false
tags: [cnc, cncjs]
---

I'm working on a pendant for my CNC, running Grbl 1.1f, and wanted to add smooth multiaxis jogging. I've already done a single axis implementation for this project: <https://github.com/Billiam/cncjs-pendant-keyboardreader>

This took me a little bit to find my way through, so I'm documenting it here.

Here's a good introduction to the feature: <https://github.com/gnea/grbl/wiki/Grbl-v1.1-Jogging>

## Smooth jogging implementation

This implementation uses the GRBL 1.1 modal jogging functionality, but not the `\x85` jog cancel feature, which has not yet been added in CNCjs at the time of this writing. [cncjs#512](https://github.com/cncjs/cncjs/pull/512)

*note: Decimal places below are rounded for simplicity*

### For a single axis

The goal here is to send frequent, small jog commands at the frequency that we expect grbl to execute them. Without jog cancel, there will be some amount of overtravel equal to 0.5 - 1.5x the update frequency (not counting network latency).

My setup includes some wifi usage, so my update frequency is relatively high at 150ms. For direct-only connections (like a touchscreen connected directly to the cncjs server), this could and should be much lower and will feel more responsive to both starting and stopping.

To move one axis at 500 mm/min, divide the total distance to travel in a minute by the update interval to get the total distance to travel for the interval \`(500\_(\"mm\")) * (150 // 60*1000) = 1.25\_(\"mm\")// 150\_(\"ms\")\`

And then issue the jog command: `$J=G91 X1.25 F500`, and then continue issuing the same jog command every 150ms until you want motion to stop.

I issue the first delayed jog command with a reduced delay, about 100ms instead of 150ms. This helps to keep grbl's buffer full, so that it doesn't try to decelerate each jog step to a stop, which results in jerky movement. This reduced delay should ideally be based on axis acceleration settings and variation in latency.

When (and if) jog cancelling is added in cncjs, the cancel command could also be added at the end of movement. Ideally, this would also allow you to exceed the requested travel distance for smoother jogging, since a jog stop could be issued when needed.

I haven't come up with a way to do this safely that wouldn't result in dangerous overshooting if the jog cancel command failed, or when using multi-axis jogging (below) though.

### For multiple axes

Multiple axis smooth jogging is a little more complicated. I also want the Z axis to move about 4 times slower than the much larger X and Y axes, meaning I'll have a ratio of axis speeds like `x:y:z -> 1 : 1 : 0.25`.

This is also important if using a multi-axis analog controller like a joystick/gamepad, or some wild 3+axis one: Each direction component will have its own speed relative to the others.

When you give grbl a jog command: `$J=G91 X5 Y5 Z5 F500`, the total distance traveled will be \`D^2=x^2+y^2+z^2\`, or about 8.66mm, since it moves in a beeline from the starting position to this offset.

To get the desired jog distance for each axis (with different travel speeds), we have to do some math.

First, we can get the diagonal of a rectangular prism with side lengths of of x1, y1, and z1 from our speed ratios, \`D = sqrt(x1^2 + y1^2 + z1^2 + \"...\")\`. This represents the relationship of `1` unit of axis speed to the diagonal travel.

For my speeds, that's \`D = sqrt(1^2 + 1^2 + 0.25^2)\`, about 1.436.

To get the actual X travel distance, it's the X speed ratio (1), the X direction(-1 or 1), and the desired travel speed, and the diagonal component:
\`X_(\"axis travel\") = (500 * -1 * 1)//D\` for a total of ~348mm/min, or -0.87mm/150ms.

The slower Z axis can be calculated the same way: \`(500 * 1\_(\"direction\") * 0.25\_(\"speed\"))//1.436\`, or 87 mm/min, but we also know its speed is 0.25 × the X axis speed, so `0.25 × 348`: 87 mm/min (0.2175/150ms).

This gives us the jog command: `$J=G91 X-0.87 Y0.87 Z.218 F500`.

Grbl will plan this move so that all axes arrive at the same time, and everything works great.

However, note that `$J=G91 Z.218 F500` would _not_ be correct for this feed rate, and will complete much more quickly than our 150ms interval, causing stuttering motion.

Instead, the feed rate needs to be reduced to the *maximum* speed of all the axes being moved (in this case, just 0.25 × 500): `$J=G91 Z.218 F125`.

This applies to multi-axis moves as well. If the speeds being used were y:0.6, z:0.25 (with no X component)

\`D\_(\"distance\")^2 = 0.6^2 + 0.25^2 = 0.65\`  
\`Y\_(\"axis\") = (500 * 1 * 0.6)//D = 461.55\_(\"mm/min\") (1.15//150\_(\"ms\"))\`  
\`Z\_(\"axis\") = (500 * 1 * 0.25)//0.65 = 192\_(\"mm/min\") (0.48//150\_(\"ms\"))\`  
\`F\_(\"feedrate\") = max(0.6, 0.25) * 500 = 300\`

Result: `$J=G91 Y1.15 Z0.48 F300`
