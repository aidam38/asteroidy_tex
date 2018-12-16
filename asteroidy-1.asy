if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="asteroidy-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm,8cm);

marker mark1 = marker(scale(circlescale*2)*unitcircle, Fill);

real a = 1.5;
real b = 1;

draw(ellipse((0,0), a, b));

draw((-1.5*a,0)--(1.5*a,0));
draw((0,-b)--(0,b));
draw((0,0), mark1);

draw((a,0), mark1);
draw((-a,0), mark1);
label("$P$", (a,0), SE);
label("$A$", (-a,0), SW);

real F = sqrt((a-b)*(a+b));
draw((F,0), mark1);
draw((-F,0), mark1);
label("$F_1$", (F,0), S);
label("$F_2$", (-F,0), S);

draw(brace((0,0), (a,0)));
label("$a$", (a/2,0.25), N);

draw(brace((0,0), (0,b)));
label("$b$", (-0.25, b/2), W);

draw((0,0)--(1.3,-1.1), arrow=EndArrow);
draw(arc((0,0), 0.5, -degrees(atan(1.1/1.3)), 0));
label("$\omega$", (0.35,-0.25), N);
