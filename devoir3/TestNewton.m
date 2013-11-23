A=[1 3 5;-2 4 6; 5 4 -8];
[eigenvecteur eigenvalue] = eig(A)

W=[0 0 ; 1 0 ; 0 1];
w=[1 0 0]';
y=[0 0]';
[vecteur iter] = NR([0.5 0]',w ,W ,A) 
K=[0 0]';
n=50;
X=linspace(-10, 10, n);
Y=linspace(-10, 10, n);
G=zeros(n,n);
L=zeros(n,n);

for i=1:n
    for j=1:n
        y=[X(i) Y(j)]';
        K = (W'*A*(w+W*y) - w'*A*(w+W*y)*y);
        G(i,j)=K(1);
        L(i,j)=K(2);
    end
end

P=zeros(n,n);
surf(X, Y, G); hold on;
surf(X , Y, L); hold on
surf(X, Y, P);
%surface(X, Y, G)
















