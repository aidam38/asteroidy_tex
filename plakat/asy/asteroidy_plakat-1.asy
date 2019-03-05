if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="asteroidy_plakat-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

// Zajisteni spravné velkosti obrazku
size(8cm,8cm);

// Definovani stylu tecek a car
marker mark1 = marker(scale(circlescale*2)*unitcircle, Fill);
marker mark2 = marker(scale(circlescale*3)*unitcircle, Fill);
pen pen1 = linetype(new real[] {1,6})+linewidth(0.4);

// Konstanty
real au = 149597870700; // Astronomicka jednotka
pair G = 6.67*pow10(-11); // Gravitacni konstanta

// Pocatecni hodnoty
pair R = (0,0); // Pocatecni poloha centralniho telesa
pair m1 = 2*pow10(30); // Hmotnost centralniho telesa (cca hmotnost Slunce)
pair r0 = (3/5*au,-4/5*au); // Pocatecni poloha telesa (Pozn.: (3/5*au)^2+(4/5*au)^2=au)
real h = 23.5*24*60*60; // Casovy krok 23.5 dnu

// Skalovani vektoru
real vscale = 1.0*au*pow10(-5);
real ascale = vscale*h;

// Neviditelny ramecek obrazku
draw((-1/5*au,-5/5*au)--(7/5*au,-5/5*au)--(7/5*au,2/5*au)--(-1/5*au,2/5*au)--cycle, invisible);

// Vykresleni centralniho telesa a analytického reseni
draw(R, marker=mark2);
label("$m_1$", shift(-0.05,-0.05)*R, SW);
draw(arc(R,length(R-r0), -53, 15), longdashed+gray(0.7));

// Vykresleni pocatecni polohy
draw(R--r0, arrow=EndArrow, pen1);
draw(r0, marker=mark1);
label("$\vec{r}_0$", shift(R)*scale(0.5)*r0,SW);

// Prvni iterace
pair a0 = (G*m1/(length(R-r0)**2))*unit(R-r0);
draw(r0--shift(r0)*scale(ascale)*a0, arrow=EndArrow);
label("$\vec{a}_0$", shift(r0)*scale(0.5)*scale(ascale)*a0, 0.6*SW);

pair v0 = rotate(-90)*unit(a0)*sqrt(G*m1/(length(R-r0)));
draw(r0--shift(r0)*scale(vscale)*v0, arrow=EndArrow);
label("$\vec{v}_0$", shift(r0)*scale(0.5)*scale(vscale)*v0, SE);

pair v1 = v0+h*a0;
draw(r0--shift(r0)*scale(vscale)*v1, arrow=EndArrow);
label("$\vec{v}_1$", shift(r0)*scale(0.4)*scale(vscale)*v1, NNW);

pair r1 = r0 + h*v0;
draw(r0--r1, dashed);

draw(R--r1, arrow=EndArrow, pen1);
draw(r1, marker=mark1);
label("$\vec{r}_1$", shift(R)*scale(0.5)*r1,SW);

// Druha iterace
pair a1 = (G*m1/(length(R-r1)**2))*unit(R-r1);
draw(r1--shift(r1)*scale(ascale)*a1, arrow=EndArrow);
label("$\vec{a}_1$", shift(r1)*scale(0.5)*scale(ascale)*a1, 0.6*SW);

// pair v1 z prvni iterace
draw(r1--shift(r1)*scale(vscale)*v1, arrow=EndArrow);
label("$\vec{v}_1$", shift(r1)*scale(0.5)*scale(vscale)*v1, SE);

pair v2 = v1+h*a1;
draw(r1--shift(r1)*scale(vscale)*v2, arrow=EndArrow);
label("$\vec{v}_2$", shift(r1)*scale(0.4)*scale(vscale)*v2, NW);

pair r2 = r1 + h*v1;
draw(r1--r2, dashed);

draw(R--r2, arrow=EndArrow, pen1);
draw(r2, marker=mark1);
label("$\vec{r}_2$", shift(R)*scale(0.5)*r2,SW);

// Treti iterace
pair a2 = (G*m1/(length(R-r2)**2))*unit(R-r2);
draw(r2--shift(r2)*scale(ascale)*a2, arrow=EndArrow);
label("$\vec{a}_2$", shift(r2)*scale(0.5)*scale(ascale)*a2, 0.6*SW);

// pair v2 z druhé iterace
draw(r2--shift(r2)*scale(vscale)*v2, arrow=EndArrow);
label("$\vec{v}_2$", shift(r2)*scale(0.5)*scale(vscale)*v2, SE);

pair v3 = v2+h*a2;
draw(r2--shift(r2)*scale(vscale)*v3, arrow=EndArrow);
label("$\vec{v}_3$", shift(r2)*scale(0.4)*scale(vscale)*v3, NW);

pair r3 = r2 + h*v2;
draw(r2--r3, dashed);

draw(R--r3, arrow=EndArrow, pen1);
draw(r3, marker=mark1);
label("$\vec{r}_3$", shift(R)*scale(0.5)*r3,S);

size(309.35591pt,0,keepAspect=true);
