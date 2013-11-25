

A=[1 3 5;-2 4 6; 5 4 -8];
W=[0 0 ; 1 0 ; 0 1];
w=[1 0 0]';
y=[0 0]';

[eigenvecteur eigenvalue] = eig(A)
[vecteur iter] = NR([0.5 0.5]',w ,W ,A) 


K=[0 0]';
n=50;
X=linspace(-10, 10, n);
Y=linspace(-10, 10, n);
G1=zeros(n,n);
G2=zeros(n,n);

for i=1:n
    for j=1:n
        y=[X(i) Y(j)]';
        K = (W'*A*(w+W*y) - w'*A*(w+W*y)*y);
        G1(i,j)=K(1);
        G2(i,j)=K(2);
    end
end

%plots
figure(1)
surf(X, Y, G1); hold on;
surf(X , Y, G2); hold on;

plot3(1.4337,-3.309,10,'c.', 'MarkerSize',10);hold on;
plot3(-0.2264,0.3972,10,'c.', 'MarkerSize',10);hold on;
plot3(0.706,0.5621,10,'c.', 'MarkerSize',10);hold on;
title('Plot de la fonction G');
xlabel('1e composante de y');
ylabel('2e composante de y');
zlabel('valeur de G');





figure(2)
%valeurs propres
quiver3(0,0,0,eigenvecteur(1,1),eigenvecteur(2,1),eigenvecteur(3,1), 'k','linewidth',2); hold on;
quiver3(0,0,0,eigenvecteur(1,2),eigenvecteur(2,2),eigenvecteur(3,2), 'k','linewidth',2); 
quiver3(0,0,0,eigenvecteur(1,3),eigenvecteur(2,3),eigenvecteur(3,3), 'k','linewidth',2);
%w
quiver3(0,0,0,1,0,0, 'b','linewidth',2);
%y
quiver3(0,0,0,0,1.4337,-3.309, 'c','linewidth',2);
quiver3(0,0,0,0,-0.2264,0.3972, 'c','linewidth',2);
quiver3(0,0,0,0,0.706,0.5621, 'c','linewidth',2);
%plan W

[y,z] = meshgrid(-1:0.1:2, -3:0.1:1);
x=zeros(size(y));
surf(x,y,z);
legend('v1','v2','v3', 'vecteur w', 'y1', 'y2', 'y3','plan W');






%Cas où w ortho a v1






