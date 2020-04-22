#!/bin/sh

## Stylus
xsetwacom set "Tablet Monitor Pen stylus" MapToOutput DisplayPort-0
xsetwacom set "Tablet Monitor Pen stylus" PressureCurve 0 10 90 100

## Pad
xsetwacom set "Tablet Monitor Pad pad" Button 1 "key ctrl ="
xsetwacom set "Tablet Monitor Pad pad" Button 2 "key ctrl -"
xsetwacom set "Tablet Monitor Pad pad" Button 3 "key shift"
xsetwacom set "Tablet Monitor Pad pad" Button 8 "key ctrl"
xsetwacom set "Tablet Monitor Pad pad" Button 9 "key e"
xsetwacom set "Tablet Monitor Pad pad" Button 10 "key shift b"

