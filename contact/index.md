---
title: Contact
layout: page
share: false
---

Have a question for me?

<form class="user-form" method="post" action="https://formsubmit.co/2c8b05b602496b73cec41d58af53e793">
  <input type="hidden" name="_replyto">
  <input type="hidden" name="_next" value="{{ "/contact/thanks" | absolute_url }}">
  <fieldset>
    <label for="email">Name</label>
    <input name="name" required id="name" placeholder="Your name">
  </fieldset>
  <fieldset>
    <label for="email">Email address</label>
    <input type="email" name="email" id="email" placeholder="Your email address">
  </fieldset>
  <fieldset>
    <label for="message">Message</label>
    <textarea cols="40" rows="8" name="message" id="message" placeholder="Your message here"></textarea>
  </fieldset>

  <fieldset>
    <button type="submit">Submit</button>
  </fieldset>
</form>
