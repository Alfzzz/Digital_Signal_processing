%%
% Example 1---Z-transform computation
%%
syms n
h1 = 0.9.^n; 
H1 = ztrans(h1)
pretty(H1)
h2 = heaviside(n)-heaviside(n-10); 
H2 = ztrans(h2)
pretty(H2)