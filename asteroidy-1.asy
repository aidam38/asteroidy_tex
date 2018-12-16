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

draw(ellipse(a,b));

draw((-1.5*a,0)--(1.5*a,0));
draw((0,-b)--(0,b));
draw((0,0), mark1);

draw((a,0), mark1);
draw((-a,0), mark1);
label("$P$", (a,0), E);
label("$A$", (-a,0), W);

real F = sqrt((a-b)(a+b);
draw((f,0), mark1);
draw((-f,0), mark1);
label("$F_1$", (f,0), N);
label("$F_2$", (-f,0), N);

draw(brace((0,0), (a,0)));
label("$a$", (a/2,-0.25), S);

draw(brace((0,0), (0,b)));
label("$b$", (-0.25, b/2), W);
