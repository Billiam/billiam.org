---
title: Centering text in CascadeStudio
tags: [cascade-studio, 3d-printing]
layout: post
date: 2022-11-20 13:20 -0500
excerpt: Just get the bounding box and translate
comments: false
share: false
image:
  og_feature: post/2022/centering/hello.jpg
---

{% include figure.html url="images/post/2022/centering/hello.jpg" description="The word hello centered inside a circle in CascadeStudio" %}

I've been using CascadeStudio recently for parametric modeling ([like this](https://www.printables.com/model/78733-parametric-hinged-small-parts-box)) and needed a way to center some dynamic text, which isn't implemented currently.

Fortunately, a user on github documented a way to get the boundary box of a solid shape here: [this discussion post](https://github.com/zalo/CascadeStudio/discussions/86#discussioncomment-506883), which makes centered (or right-aligned) text easy.

```javascript
// https://github.com/zalo/CascadeStudio/discussions/86#discussioncomment-506883
const getBounds = shape => {
    const bmin = { x: Infinity, y: Infinity, z: Infinity },
        bmax = { x: -Infinity, y: -Infinity, z: -Infinity };

    ForEachFace(shape, (index, face) => {
        ForEachVertex(face, (vertex) => {
            const pnt = oc.BRep_Tool.prototype.Pnt(vertex);
            const x = pnt.X(), y = pnt.Y(), z = pnt.Z();

            if (x < bmin.x) bmin.x = x;
            if (y < bmin.y) bmin.y = y;
            if (z < bmin.z) bmin.z = z;

            if (x > bmax.x) bmax.x = x;
            if (y > bmax.y) bmax.y = y;
            if (z > bmax.z) bmax.z = z;
        });
    });
    return [bmin, bmax];
}

// create the text shape
const textShape = Text3D("hello!", 10, 0.1);

// get the minimum and maximum bounds for the text
const [min, max] = getBounds(textShape);
const width = max.x - min.x;
const height = max.z - min.z;

// translate the text by half the width and height
Translate(
    [-width / 2, 0, -height / 2],
    textShape,
    false);
```

[Demo link](https://zalo.github.io/CascadeStudio/#code=dVPLbtswELzrK7buRQYk0WnQwIibHNI2QG5FYxRtjaCgJcoiIJGCtEolBf73Lh%2BynSbhhVxyZmd2STIGBWLdXjK2k1h02yTVFRt5qdln3qY8E%2FfYZVKzTLZp17ZSq5YtL94fQ8JXQmH8cXGxXJ4HKQEQdgJvdKeyFq6gLXgt4OoangKg4QDbSio6e4L%2BEu5ULpXEIYLhNBiPAewjyzVjW%2FF%2BYsbPqPEzbnwkrwLLvtXNV54WtzwVoTUVQShVJvoIctqbHz2eoH%2BIBkUfGgDBH230H%2FJYVa2QrOk0ufku6j9rrcukbjRqHGqRfFM48VevcE1RxE9%2BhnOqxge%2FTDD64Hc495VMQ%2BYQ9vDJdjMhW24meL96gRsm3OBxRmN4iRsn3OhxRn58VfjaXoYTNvNbwh43eNybwh43epwXnjB737ZpbgR2jYKNMRlZxsMq2AdBKRCoyeYm1jTdqbrDcGaWswhmhShL%2FY5W2HTC9JMxSBvBUQAWwhHt4%2FAv2Wzcuxds051%2FCc1WBGeLCBbJGaWgDDujSXSyIquuAq4yIEN2vXUfIdfNQcHn3ljnxjglP3yZ8CBp7DnkX5lhQSDX5hjsPa%2F8YSHkrkB%2FOvrT0ZVW6ceTwrYDFLzM7YZLaYw6frBuuGpLakRo27uJHYLBByo0gtjLUPzgfuPBpwtzXrZk%2BR8%3D&gui=q1ZKzs8tyM9LzSvxS8xNVbJSSk4sTk5MSQ3LTC1X0lHyTS3OCEotVrIy0DPUUXJOTM5ItVeyKikqTdVRci%2FKL81LCchJzEMWy0yBc4ISUzJLgXqNDWoB)
