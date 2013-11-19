function [ y] = NR(y, w, W, A)
%NR Newton-Raphson implementation for non symetric matrix
%   

G = W'*A*(w+W*y)-w'*A*(w+W*y)*y;

for i = 1:500
JG = W'*A*W-w'*A*w-2*w'*A*W*y; % function G's jacobian 
y = -(JG\G)+y;
end

end
