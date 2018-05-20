---
layout: post
title: 'Tabletop Simulator: Keep Multiple Autosaves'
date: 2018-05-19 19:47:31
excerpt: Solving problems the wrong way
comments: false
share: false
tags: [games, windows, tabletop-simulator, powershell]
---

I had a system crash which caused Tabletop Simulator to write an incomplete/corrupted autosave file, 
and lost about an hour of progress in a board game.

Here’s a powershell script to rotate multiple copies of TTS’s TS_AutoSave.json. I now just run this via scheduled tasks every few minutes (TTS autosaves every 5 minutes if autosave is enabled).

```powershell
# Keep a series of backups of Tabletop Simulator's
# autosave files in a subdirectory

# The most recent five will keep the .json file extenion,
# older ones will use .bak, so that Tabletop Simulator 
# will not try to process them.

# Update with the path to your save directory
$sourceDir = "C:\Path\To\Documents\My Games\Tabletop Simulator\Saves"
$destinationDir = $sourceDir + "\Autosave"

# The total number of rotated backups to keep.
# Tabletop simulator saves every 5 minutes, 
# so 15 files allows you to roll back to a save 75 minutes old
$maxFiles = 15

$source = $sourceDir + "\TS_AutoSave.json"
$destination = $destinationDir + "\00.json"

if (!(Test-Path $destination) -or ((Get-Item $source).LastWriteTime -gt (Get-Item $destination).LastWriteTime)) {
  $files = Get-ChildItem -Path $destinationDir\* -include *.json, *.bak

  for ($counter=$files.count - 1; $counter -ge 0; $counter--) {
    $filepath = $files[$counter].FullName

    if ($maxFiles -gt 0 -and $counter -gt ($maxFiles - 2)) {
      Remove-Item -Path $filepath
    } else {
      $newName = "$destinationDir\$(($counter + 1).ToString('00')).json"
      if ($counter -gt 3) {
        $newName += ".bak"
      }
      Rename-Item -Path $filepath -NewName $newName
    }
  }

  Copy-Item $source $destination
}
```


If you’re running linux or linux-like, `logrotate` will do a better job, but the Windows implementations are incomplete.
