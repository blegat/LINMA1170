% Matrice 1 3*3
n=3;
A1=randn(n);
[eigenvecteur1 eigenvalue1] = eig(A1);

w=[1, zeros(1,n-1)]';
W=eye(n);
W=W(:,2:end);
y=0.5*ones(n-1,1);

[vecteur1 iter1] = NR(y,w ,W ,A1) 

% Matrice 1 5*5
n=5;
A2=randn(n);
[eigenvecteur2 eigenvalue2] = eig(A2);

w=[1, zeros(1,n-1)]';
W=eye(n);
W=W(:,2:end);
y=0.5*ones(n-1,1);

[vecteur2 iter2] = NR(y,w ,W ,A2) 

% Matrice 1 10*10
n=10;
A3=randn(n);
[eigenvecteur3 eigenvalue3] = eig(A3);

w=[1, zeros(1,n-1)]';
W=eye(n);
W=W(:,2:end);
y=0.5*ones(n-1,1);

[vecteur3 iter3] = NR(y,w ,W ,A3) 

% Matrice 1 50*50
n=50;
A4=randn(n);
[eigenvecteur4 eigenvalue4] = eig(A4);

w=[1, zeros(1,n-1)]';
W=eye(n);
W=W(:,2:end);
y=0.5*ones(n-1,1);

[vecteur4 iter4] = NR(y,w ,W ,A4)






