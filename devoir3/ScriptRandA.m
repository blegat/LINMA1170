%%
A = randn(50);
x= randn(50,1);
x = x/norm(x);
y= randn(50,1);
y = y/norm(y);
RQIA(A,x,y)