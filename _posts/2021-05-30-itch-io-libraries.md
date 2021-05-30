---
layout: post
title: Tools for managing itch.io games
date: 2021-05-30 17:51 -0600
comments: false
share: false
tags: [itch]
---

I've released a few projects I'm using for managing projects and games on [itch.io](https://itch.io/).

## itchpack

The first is [itchpack](https://github.com/billiam/itchpack), commandline, preconfigured wrapper around webpack with some extra utilities.

Itchpack provides a local development environment for game, gamejam, and profile pages on itch.io.

It downloads your current page markup and styles, can render templated data from a data file, prefixes `custom-` in front of your HTML classes, handles sass/scss compilation, and provides live reloading when working locally.

I used it extensively while working on the [game page for Deepdwn](https://billiam.itch.io/deepdwn).

## itch_client

[itch_client](https://github.com/billiam/itch-client) is a ruby library for interacting with itch.io. There are some functions I needed for the next project which are unavailable in the itch API.

`itch_client` is a screenscraping client and provides authentication, updating and fetching reward information, as well as purchase and reward redemption logs.

## itch-rewards

[itch-rewards](https://github.com/billiam/itch-community-rewards) is a commandline application based on `itch_client`, meant for automating available game page rewards, especially for [community copies](http://berdan.ca/andy/community-accessibility-on-itchio).

`itch-rewards` allows a game developer to set a minimum number of copies that are always available, or to have the number update based on sales (for instance: "Every copy of my game sold makes a community copy available!"), or based on tips above the game price (configurable).

`itch-rewards` can also update the reward content itself, to show the number of copies that have been made available, or progress to the next copy.

I'm using this in concert with the script used for my [desk bell notifications]({% post_url 2021-03-07-desk-bell-alerts %}) to update available rewards after purchases.