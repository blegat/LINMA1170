function [y i Q G erreur] = NR(y, w, W, A)
%NR Newton-Raphson implementation for non symetric matrix
%
i = 1;
eLim = 1e-20;
err = eLim +1;
l=length(A);

while i < 500 && err > eLim
    G = W'*A*(w+W*y)-w'*A*(w+W*y)*y;
    JG = W'*A*W-w'*A*w*eye(l-1)-(y*w'*A*W + w'*A*W*y*eye(l-1)); % function G's jacobian
    y1 = -(JG\G)+y;
    err = norm(y1-y)
    y= y1;
    if i==1
       Q=y; 
    else
       Q=[Q, y];
    end
    i = i + 1;
end
G = W'*A*(w+W*y)-w'*A*(w+W*y)*y;
y=w+W*y;
%y=y/norm(y);

erreur = zeros(i,1);

 for j=1:i-1
     erreur(j)=norm(w+W*Q(1:l-1, j) - y);
 end
figure(1)
loglog(1:i,erreur,'b');
title('erreur (logarithmique) de la methode de Newton');
xlabel('nombre d iterations');
ylabel('log(erreur)');

end


















