---
layout: post
title: 'Sequence8: A PICO-8 music toy'
date: 2020-07-04 21:47 -0500
excerpt:
comments: false
share: false
tags: [games,pico8,sequence,gamedev]
image:
    feature: post/2020/sequence8/11-final-particles.gif
    og_feature: post/2020/sequence8/logo-thumb.gif
    thumb: post/2020/sequence8/logo-thumb.gif
---

I've just launched Sequence8, a PICO-8 music sequencer toy.

<iframe frameborder="0" src="https://itch.io/embed/680285" width="100%" height="167"><a href="https://billiam.itch.io/sequence8">Sequence8 by billiam</a></iframe>

Here's a video:

{% include youtube.html id="cj8frWLg9YQ" vq="hd720" %}

You can play with it in the browser at <https://billiam.itch.io/sequence8>, or download prebuilt binaries.

The copy button will save your song to your clipboard so that you can keep and share them.

To import a song, just paste it in.

Shorter songs fit in a tweet, so if you make something you like, please [share
it with me!](https://twitter.com/intent/tweet?text=@billiporter)

I picked up [PICO-8](https://pico8.com) in the [enormous Itch.io bundle](https://itch.io/b/520/bundle-for-racial-justice-and-equality) recently, and have been having a lot of fun with it. Sequence8 is my first PICO-8 game.

The platform's built-in limitations help ensure that games stay small and (roughly) within scope. They can't be too large in code length, or lexical tokens, nor in sprites, sound, or music. Audio is limited to four channels, the screen is 128px square, there are 16 colors.

Sequence8 is based on another project I never finished, built with Ruby and [Gosu](https://www.libgosu.org/).

{% include youtube.html id="uSDD8GxuT9c" %}

There, I was able to use several full sized audio samples of real instruments, and dynamically pitch them up.
Visual effects could be handled with transparencies and complex masks. I used C libraries for fast quadtree performance
for mouse events. Can't really do any of that in PICO-8  (at least, I can't).

Here's some of the build process

### Getting started

This is the first prototype. It can play sounds. The current beat scrolls by.

{% include figure.html url="images/post/2020/sequence8/01-prototype.gif" description="Initial prototype" %}


Here I've started adding the sprites for the background, scrub bar, and selected notes, and one of the only sprite animations.

I found [this post](https://www.lexaloffle.com/bbs/?tid=3386) invaluable when trying to work with PICO-8's color palette.

{% include figure.html url="images/post/2020/sequence8/02-sprites.gif" description="Adding sprites" %}

### UI

Without the ability to bind a bunch of arbitrary keyboard shortcuts, I actually had to build out the UI for this as well,
which took the vast majority of the project's development time.

Challenges here were:

* Adding mouse support and mapping screen pixels to UI elements,
* having logical controller navigation for an irregular grid,
* switching between mouse and controller input without breaking something
* having a different number of notes for some instruments,
* adding and removing bars of music (which also adds and removes UI elements)

I probably rebuilt the whole UI system 3 or 4 times, and I'm still not happy with it.

{% include figure.html url="images/post/2020/sequence8/03-tabs.gif" description="UI as tabs" %}

I think this didn't work well because the tab as a UI concept implies nesting content underneath the tab, but I wanted to have more
information about the other instrument tracks visible at once.

Here's the mouse support. It's mostly built on top of the controller support, so while the mouse has a pixel position, it also
maintains a position within the UI grid, identical to controller handling.

{% include figure.html url="images/post/2020/sequence8/04-mouse.gif" description="Mouse support" %}


### Lighting

I went through a few iterations for lighting effects. Originally, the song progress bar was represented by a full column of sprites, as well as
some smaller sprites to both sides that would overlay the background to fake a glowing effect.

In this version, the notes light up for a moment after they're played. This is handled with a palette swap, and redrawing pixels surrounding each note. It's wildly expensive, but it looks nice, and fixes issues with static overlays on top of animated images.

{% include figure.html url="images/post/2020/sequence8/06-light-fade.gif" description="Light fade effect" %}

I'm doing this in a pretty simplistic way. For a much more performant (and technical approach), here's a really cool article:  
[https://hackernoon.com/pico-8-lighting-part-1-thin-dark-line-8ea15d21fed7](hackernoon.com)

{% include figure.html url="images/post/2020/sequence8/07-light-performance.gif" description="Light fade effect failing to maintain 60fps" %}

In the end, I used a simpler approach, using one level of lighting off to the sides of the

### Particles

I started on some particle effects to make the visuals a little more engaging, but ran into further performance issues there. I put together a
simple profiler to help track down the specifics.

{% include figure.html url="images/post/2020/sequence8/09-profiler.gif" description="Profiler" %}

PICO-8, as a virtual console, has it's own CPU limits distinct from the host system, and applies extra CPU cost to some operations.

The biggest takeaway here for me was: Limit expensive redrawing, limit deeply nested loops, limit overall particle counts (and make sure that
  count is up to date, and not from the last animation frame. Whoops)

I think these look nice still, but they're big, slow and floaty, like each note is shaking down snow. Still nice, but I wanted a more explosive feel.

{% include figure.html url="images/post/2020/sequence8/08-particle-snow.gif" description="Big slow particles" %}

Here's a less colorful, and more conservative version. Particles have more starting velocity, and fade faster.

{% include figure.html url="images/post/2020/sequence8/10-particles.gif" description="Smaller particle effects" %}

Here's the final version. Notable changes here:
* Notes are always in front of the particles, and have a bit of an opaque outline around them,
making them much more visible when a lot is happening on screen.
* Two or three contrast frames at beginning of the particle burst, making it more distinct and poppy.

{% include figure.html url="images/post/2020/sequence8/11-final-particles.gif" description="Final particle effects" %}

I recommend looking through (and supporting) this amazing pixel art resource: <https://blog.studiominiboss.com/pixelart>
