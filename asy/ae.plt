#!/usr/bin/gnuplot

load "preamble.plt"

set xlabel "{/Helvetica-Oblique a}_p [AU]" 
set ylabel "{/Helvetica-Oblique e}_p" 

set xrange [amin:amax]
set yrange [emin:emax]

e(a,q)=abs((q-a)/a)

plot 	"check_BOX.dat" using 36:37:(f_(D($35,p_V))*0.3) with point linestyle 1 pointsize variable linecolor rgb "0xcccccc" title "background",\
 	"eunomia_family.list" using 36:37:(f_(D($35,p_V))*0.3) with points linestyle 2 pointsize variable title "observed family",\
	filename using 3:4:(f_($9)*0.31) with points title "synthetic family" linestyle 3 pointsize variable,\
	e(x,1.52) not linetype 8 linewidth 1
quit
