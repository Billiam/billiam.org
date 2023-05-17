---
title: Home Assistant setup with Dokku
tags: [automation, 3d-printing, home-assistant, dokku]
layout: post
date: 2023-05-17 13:47:00 -0500
comments: false
share: false
---

I installed [Home Assistant](https://home-assistant.io) with [Dokku](https://dokku.com). It was very easy, but there were a couple of gotchas that slowed it down a bit.

## Setup

Create a new `homeassistant` app in Dokku

```sh
dokku apps:create homeassistant
```

Set the timezone

```sh
dokku config:set homeassistant TZ=America/Chicago
```

Create a folder that will be used for Home Assistant configuration

```sh
mkdir /path/to/my-config
dokku storage:mount homeassistant /path/to/my-config:/config
```

Home Assistant uses its own init procedure, and we need to disable automatic init

```sh
dokku scheduler-docker-local:set homeassistant init-process false
```

Initialize Home Assistant app from its docker image

```sh
dokku git:from-image homeassistant ghcr.io/home-assistant/home-assistant:stable
```

Dokku didn't correctly configure the correct port for the container, so:

Remove the default proxy port if needed:

```sh
dokku proxy:ports-remove homeassistant http:80:5000
```

Add the correct proxy port:

```sh
dokku proxy:ports-add homeassistant http:80:8123
```

Currently, I'm just using this for print notifications for the BambuLab P1P (using [ha-bambulab](https://github.com/greghesp/ha-bambulab)), and to turn the integrated light off after printing, but I'm looking to extend some other ad-hoc automations I have set up as well.
