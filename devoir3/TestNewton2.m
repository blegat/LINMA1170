% PLOT des figures Newton erreur (fig 4)
n=5;
A2=randn(n);
[eigenvecteur2 eigenvalue2] = eig(A2)

w=[1, zeros(1,n-1)]';
W=eye(n);
W=W(:,2:end);
y=0.5*ones(n-1,1);

[vecteur2 iter2 Q G erreur] = NR(y,w ,W ,A2) 