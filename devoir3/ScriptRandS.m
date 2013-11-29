%%
A = randn(50);
A = A + A';
x= randn(50,1);
x = x/norm(x);
RQIS(A,x)
