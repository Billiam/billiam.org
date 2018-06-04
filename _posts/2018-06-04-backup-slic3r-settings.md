---
layout: post
title: 'Periodic Slic3r Settings Backup (in windows)'
date: 2018-06-04 16:57:21
excerpt: More Windows Nonsense
comments: false
share: false
tags: [slic3r, 3d-printing, windows, git]
---

I've been using [Slic3r](http://slic3r.org/) with my 3d printer, but wanted to be able to easily restore
old configuration values, compare changes and so forth.

Slic3r helpfully stores it's configuration in INI files in the `%appdata%` directory, 
so the below batch script launches slic3r, and periodically git commits the configuration directory.

While the batch is running, launching the batch again will start a new instance of Slic3r and then exit.

### Prerequisites

* Git must be installed, and available in the path.

### slic3r.bat

```powershell
echo off

set "slic3rpath=C:\path\to\Slic3r.exe"
set "configpath=%appdata%\Slic3r"
set "batchpath=%~dp0"
set "lockpath=%batchpath%slic3r.lock"

start "" "%slic3rpath%"

if exist "%lockpath%" (
  exit /b 1
)

copy NUL "%lockpath%"

:loop
timeout /t 120 /nobreak

tasklist /FI "IMAGENAME eq slic3r.exe" 2>NUL | find /I /N "slic3r.exe">NUL
if "%ERRORLEVEL%"=="0" (
  git -C "%configpath%" commit -a -m "Scheduled update"
  goto loop
)

DEL "%lockpath%"
```

I run this minimized (not completely hidden) by creating a shortcut to it, and setting the "Run" value to "Minimized" in the shortcut's properties.
