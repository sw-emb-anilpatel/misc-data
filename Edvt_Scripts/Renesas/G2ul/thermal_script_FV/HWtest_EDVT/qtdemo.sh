#!/bin/sh

#!/usr/local/bin/gnuplot -persist
# set terminal gif transparent nocrop enhanced animate delay 10 loop 0 nooptimize size 200,200 background "#000000" font "verdana,12.0" 
# set output 'animate2.1.png'
unset border
set dummy u, v
set angles degrees
unset key
set parametric
set view 60, 131, 1.5, 1
set samples 64, 64
set isosamples 13, 13
set mapping spherical
set hidden3d back offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set size ratio 1 1,1
set style data lines
unset xtics
unset ytics
unset ztics
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [ 0.00000 : 360.000 ] noreverse nowriteback
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ * : * ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault
xview(xrot)=xrot
zview(zrot)=zrot
NO_ANIMATION = 1
limit_iterations = 72
xrot = 60
xrot_delta = 0
zrot = 126
zrot_delta = 355
iteration_count = 73
iteration_delay = 0.1
## Last datafile plotted: "world.dat"
splot cos(u)*cos(v),cos(u)*sin(v),sin(u) notitle with lines lt 5,       'world.dat' notitle with lines lt 2 lw 3
