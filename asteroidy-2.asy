if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="asteroidy-2";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);

marker mark1 = marker(scale(circlescale*2)*unitcircle, Fill);

real s = 1.2;
real a = 1.5;
real b = 1;
real f = 110;
real e = sqrt(1-(b*b)/(a*a));

real F = a*e;

draw(ellipse((-F,0), a, b));
draw(circle((-F,0), a));

real extra = 0.3;
draw((-F-a-extra,0)--(a-F+extra,0));
draw((0,-a)--(0,a));
label("$x$", (a-F+extra,0), S);
label("$y$", (0,a), E);
draw((0,0), mark1);
draw((-F,0), mark1);
draw((-2*F,0), mark1);
label("$F_1$", (0,0), SW);
label("$F_2$", (-2*F,0), S);

real E = 2*atan(sqrt((1-e)/(1+e))*tan(radians(f)/2));
real r = a*(1-e*cos(E));
pair P = (r*Cos(f), r*Sin(f));
pair Pp = (r*Cos(f), a*sin(E));

draw(P, mark1);
draw(Pp, mark1);
label("$P$", P, SW);
label("$P'$", Pp, NE);

draw((0,0)--P);
draw((-F,0)--Pp);
draw(arc((0,0), (0.3,0), P));
draw(arc((-F,0), (-F+0.3,0), Pp));
label("$f$", (0,0), rotate(f/2)*(1.1,0));
label("$E$", (-F,0), rotate(degrees(E)/2)*(2,0));

draw((P.x,0)--Pp, dashed);
