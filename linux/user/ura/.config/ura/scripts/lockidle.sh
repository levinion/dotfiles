#!/bin/bash

wlopm --on DP-5

swayidle -w \
  timeout 60 'wlopm --off DP-5' \
  resume 'wlopm --on DP-5' &

IDLE_PID=$!

swaylock -i ~/.config/ura/assets/bg.jpg

kill $IDLE_PID

wlopm --on DP-5
