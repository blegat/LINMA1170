A=[2 4 6; 4 2 1; 6 1 2];
x=[1 1 0]';
[a b]=eig(A)
n=100;
t=linspace(-10,10,n);
rho=zeros(n,1);
essai=zeros(n,1);

for i=1:n
    x(3)=(-14-sqrt(196-4*(12-2*t(i))*(2-t(i))))/(2*(2-t(i)));
    essai(i)= (x'*A*x)/(x'*x);
    [rho(i,1)] = RQIS(A,x);
    
end
rho
essai
x(3)=(-14+sqrt(196-4*(12-2*3)*(2-3)))/(2*(2-3));
x
    pttt= (x'*A*x)/(x'*x)
plot(rho); hold on;