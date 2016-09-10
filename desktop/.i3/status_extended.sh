#!/bin/sh

i3status | while :
do
	read line
	# artist=$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)
	# song=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
  text=$(mpc current --format "%title% - %artist%" | head -n 1)
  dat="[{ \"full_text\": \"$text\" },"
  echo "${line/[/$dat}" || exit 1
done
