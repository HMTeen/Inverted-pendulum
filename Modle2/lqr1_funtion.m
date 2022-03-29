function dw = lqr1_funtion(u)


I = 0.0034;
m = 0.109;
l = 0.25;
g = 9.8;
uu = u(1);
phi = u(2);


dw = ( m*g*l*sin(phi)+m*l*uu*cos(phi) )/( I+m*l*l );
