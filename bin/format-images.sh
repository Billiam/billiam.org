#!/usr/bin/env bash

: ${1?' directory name is required'}

mogrify -path "$1/.." -strip -channel rgb -contrast-stretch 0.1%x1% -adaptive-resize 1200x1200\> -quality 90% -format jpg "$1/*.jpg"
