---
title: Karakeep setup with Dokku
tags: [dokku]
layout: post
date: 2025-04-16 17:18:00 -0500
comments: false
share: false
---

I'm in the process of setting up [karakeep](https://karakeep.app/) (formerly Hoarder) to replace [Pinry](https://github.com/pinry/pinry), and am [once again]({% post_url 2023-05-17-homeassistant-dokku %})
installing it on a server running dokku.

This is convenient for my own projects using common service dependencies,
but is proving increasingly complicated with newer projects.

Anyway, here's what I needed to do to get karakeep running in dokku:

```sh
# Create apps
dokku apps:create headless-shell
dokku apps:create karakeep

# Create a network to share between apps
dokku network:create karakeep-services

# Attach karakeep and chrome to the same network
dokku network:set headless-shell attach-post-create karakeep-services
dokku network:set karakeep attach-post-create karakeep-services

# Create and link karakeep service
dokku meilisearch:create kara-search
dokku meilisearch:link kara-search karakeep

# Create headless browser app manually
dokku config:set headless-shell DOKKU_DOCKERFILE_START_CMD=" --disable-gpu --disable-crash-reporter --no-crashpad --disable-dev-shm-usage --hide-scrollbars"
# disable headless-shell web proxy
dokku proxy:disable headless-shell
# Pull the headless shell image
dokku git:from-image headless-shell chromedp/headless-shell:137.0.7117.2

# Create storage for karakeep
dokku storage:mount karakeep /path/to/local/storage:/data
# karakeep uses its own init process, so disable dokku's
dokku scheduler-docker-local:set karakeep init-process false
# set port mapping manually (or https:443:3000 depending on setup)
dokku ports:add karakeep http:80:3000
# Set config values
dokku config:set karakeep DATA_DIR=/data NEXTAUTH_SECRET=<secret> BROWSER_WEB_URL=http://headless-shell.web:9222

# Use dokku config:get karakeep MEILSEARCH_URL to show the linked API key and URL
dokku config:set karakeep MEILI_ADDR=http://dokku-meilisearch-kara-search:7700
dokku config:set karakeep MEILI_MASTER_KEY=<api key from MEILSEARCH_URL above>

# Set the logout URL
dokku config:set karakeep NEXTAUTH_URL=http://$(dokku domains:report karakeep --domains-app-vhosts)
# Pull the karakeep image
dokku git:from-image karakeep ghcr.io/karakeep-app/karakeep:0.23.2
```
