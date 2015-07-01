---
layout: post
title: "Copy Last Git Hash"
date: 2013-07-02 01:07
comments: false
share: false
tags: [git]
---

Show the most recent git commit hash, and copy it to the clipboard:

### Linux

```sh
git rev-parse HEAD | tee xclip -selection c
```

### Windows (mingw/cygwin)

```sh
git rev-parse HEAD | tee /dev/clipboard
```

### Mac

```bash
git rev-parse HEAD | tee pbcopy
```
