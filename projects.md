---
title: Project logs
layout: page
permalink: /projects/index.html
share: false
---
<div class="project-list">
{% for project in site.projects %}
<article>
<a href="{{ site.baseurl }}{{ project.url }}">
<figure>
  <div class="thumb-wrap">
  <img src="{{site.baseurl}}/images/{{ project.image.thumb }}" alt="{{ project.title }} thumbnail" />
  </div>
  <figcaption>{{ project.title }}</figcaption>
</figure>
</a>
</article>
{% endfor %}

<article>
<a href="{{ site.baseurl}}{% post_url 2019-05-29-sherbet-an-ergonomic-keypad %}">
<figure>
  <div class="thumb-wrap">
  <img src="{{site.baseurl}}/images/post/2019/keypad/thumb.jpg" alt="Gaming keypad thumbnail" />
  </div>
  <figcaption>Sherbet: an ergonomic gaming keypad</figcaption>
</figure>
</a>
</article>

</div>