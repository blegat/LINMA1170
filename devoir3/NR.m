function [eigenVector i] = NR(y, w, W, A)
% NR is the Newton-Raphson iteration method implementated to solve the
% problem G(y)=0 where G(y) =  W'*A*(w+W*y)-w'*A*(w+W*y)*y.
% The maximum number of iteration is set at 500. The precision is set at
% 1e-10.
%
% in :      - 'A' = matrix (real or complex, symetric or not) n*n 
%           - 'w' is a vector n*1
%           - 'W' is a matrix n*(n-1) orthogonal to w
%           - 'y' a (n-1)*1 vector and is the first iterate
%
% out :     - 'i' is the number of iterations which has been necessary to
%             converge (error<1e-5).
%           - 'eigenVector' is the eigen-vector = w+Wy where y is the 
%             vector towards the iteration method converge.
%            


i = 1;
eLim = 1e-5;
err = eLim +1;
l=length(A);

while i < 500 && err > eLim
    G = W'*A*(w+W*y)-w'*A*(w+W*y)*y;
    JG = W'*A*W-w'*A*w*eye(l-1)-(y*w'*A*W + w'*A*W*y*eye(l-1));
    y1 = -(JG\G)+y;
    err = norm(y1-y);
    y= y1;
    i = i + 1;
end

eigenVector = w+W*y;
eigenVector = eigenVector/norm(eigenVector);
end


















