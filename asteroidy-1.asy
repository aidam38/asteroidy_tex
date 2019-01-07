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

size(12cm);

marker mark1 = marker(scale(circlescale*2)*unitcircle, Fill);

real a = 1.5;
real b = 1;
real omega = 25;
real s = 1.5;

draw(rotate(omega)*ellipse((0,0), a, b));

draw(rotate(omega)*(a,0)--rotate(omega)*(-a,0));
draw(rotate(omega)*(0,-b)--rotate(omega)*(0,b));
draw((0,0), mark1);

draw(rotate(omega)*(a,0), mark1);
draw(rotate(omega)*(-a,0), mark1);
label("{\footnotesize pericentrum}", rotate(omega)*(a,0), rotate(omega)*E);
label("{\footnotesize apocentrum}", rotate(omega)*(-a,0), rotate(omega)*W);

real F = sqrt((a-b)*(a+b));
draw(rotate(omega)*(F,0), mark1);
draw(rotate(omega)*(-F,0), mark1);
label("$F_1$", rotate(omega)*(F,0), S);
label("$F_2$", rotate(omega)*(-F,0), S);

draw(rotate(omega)*brace((0,0), (a,0)));
label("$a$", rotate(omega)*(a/2,0), rotate(omega)*4N);

draw(brace((0,0), rotate(omega)*(0,b)));
label("$b$", rotate(omega)*(0, b/2), rotate(omega)*3W);

draw((0,0)--scale(s)*(a,0), arrow=EndArrow);
//draw((0,0)--scale(s)*(0,b), arrow=EndArrow);
label("{\footnotesize referenční směr}", scale(s)*(a,0), S);
//label("$y$", scale(s-0.2)*(0,b), W);
draw(scale(0.3)*arc((0,0),(a,0),rotate(omega)*(F,0)));
label("$\omega$", (0,0), rotate(omega/2)*(6,0));
