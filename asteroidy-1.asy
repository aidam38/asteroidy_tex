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

unitsize(5cm);

marker mark1 = marker(scale(circlescale*2)*unitcircle, Fill);
marker mark2 = marker(scale(circlescale*7)*unitcircle, Fill);
real ascale = 1;
real vscale = 0.5;

pair R = (0,0);
pair r0 = (0.57,-1);
pair M = 0.3;
pair m = 1;
pair G = 1;

real h = 0.8;

draw(R, marker=mark2);
draw(r0, marker=mark1);
label("$M$", shift(-0.05,-0.05)*R, SW);

draw(arc(R,length(R-r0), -60, 15), longdashed+gray(0.7));

// První iterace
pair a0 = (G*M/(length(R-r0)**2))*unit(R-r0);
draw(r0--shift(r0)*scale(ascale)*a0, arrow=EndArrow);
label("$\mathbf{a_0}$", shift(r0)*scale(0.5)*scale(ascale)*a0, SSW);

pair v0 = rotate(-90)*unit(a0)*sqrt(G*M/(length(R-r0)));
draw(r0--shift(r0)*scale(vscale)*v0, arrow=EndArrow);
label("$\mathbf{v_0}$", shift(r0)*scale(0.5)*scale(vscale)*v0, SE);

pair v1 = v0+h*a0;
draw(r0--shift(r0)*scale(vscale)*v1, arrow=EndArrow);
label("$\mathbf{v_1}$", shift(r0)*scale(0.4)*scale(vscale)*v1, NNW);

pair r1 = r0 + h*v1;
draw(r0--r1, dashed);
draw(r1, marker=mark1);

// Druhá iterace
pair a1 = (G*M/(length(R-r1)**2))*unit(R-r1);
draw(r1--shift(r1)*scale(ascale)*a1, arrow=EndArrow);
label("$\mathbf{a_1}$", shift(r1)*scale(0.5)*scale(ascale)*a1, SSW);

// pair v1
draw(r1--shift(r1)*scale(vscale)*v1, arrow=EndArrow);
label("$\mathbf{v_X}$", shift(r1)*scale(0.5)*scale(vscale)*v1, SE);

pair v2 = v1+h*a1;
draw(r1--shift(r1)*scale(vscale)*v2, arrow=EndArrow);
label("$\mathbf{v_2}$", shift(r1)*scale(0.4)*scale(vscale)*v2, NW);

pair r2 = r1 + h*v2;
draw(r1--r2, dashed);
draw(r2, marker=mark1);

// Třetí iterace
pair a2 = (G*M/(length(R-r2)**2))*unit(R-r2);
draw(r2--shift(r2)*scale(ascale)*a2, arrow=EndArrow);
label("$\mathbf{a_2}$", shift(r2)*scale(0.5)*scale(ascale)*a2, SSW);

// pair v2
draw(r2--shift(r2)*scale(vscale)*v2, arrow=EndArrow);
label("$\mathbf{v_2}$", shift(r2)*scale(0.5)*scale(vscale)*v2, SE);

pair v3 = v2+h*a2;
draw(r2--shift(r2)*scale(vscale)*v3, arrow=EndArrow);
label("$\mathbf{v_3}$", shift(r2)*scale(0.4)*scale(vscale)*v3, NW);

pair r3 = r2 + h*v3;
draw(r2--r3, dashed);
draw(r3, marker=mark1);

file fout = output("out.txt");
write(fout, length(R-r0));
//write(fout, length(v0));
