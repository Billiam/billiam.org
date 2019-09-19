---
layout: post
title: 'Released JotDown, a markdown editing suite'
date: 2019-09-17 17:01:14
excerpt: JotDown is a note-taking and organizing application built in Electron.
comments: false
share: false
tags: [software]
---

After several years of stagnation, I've released [JotDown: a markdown editing suite](https://billiam.itch.io/jotdown/)
 on Itch.io

{% include figure.html url="images/post/2019/jotdown/distraction.gif" description="Fullscreen and distraction free modes" %}

## Another markdown editor? Really?

While there's certainly no shortage of markdown editors available, I wanted something more specific. Namely, 
a better way to organize markdown files. 

Markdown files can be grouped together by category, directory, or tag, and that metadata is stored in an standard and
portable way: as YAML at the beginning of the file, for example:

```md
---
title: My Document Title
category: School
tags:
  - notes
  - todo
---

## My Heading

Lots of notes go here
```

I use JotDown for organizing and planning projects, campaign notes and ideas for tabletop games, and journaling for 
longer term projects.

Maybe it'll be useful for somebody else as well.

It also supports all or most of the usual markdown editor features, but also includes: 

* Rendering of flow charts and sequence diagrams
* Markdown preview including synced checkbox lists
* Typewriter and distraction free modes
  Vlambeer-inspired powermode. Makes writing streaks more exciting

However, I haven't spent any money on it yet, and that means that neither the Windows build, nor the (untested) Mac
build have been code-signed. _That_ means that your operating system is likely to either show you a warning when running
this application, or may prevent you from running it entirely.

If there's enough interest to warrant the cost, I'll get one or both of those signed in the future.

[https://billiam.itch.io/jotdown/](https://billiam.itch.io/jotdown/)
