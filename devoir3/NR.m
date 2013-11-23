function [ y] = NR(y, w, W, A)
%NR Newton-Raphson implementation for non symetric matrix
%
i = 1;
eLim = 1e-5;
err = eLim +1;

while i < 500 && err > eLim
    G = W'*A*(w+W*y)-w'*A*(w+W*y)*y;
    JG = W'*A*W-w'*A*w-2*w'*A*W*y; % function G's jacobian
    y1 = -(JG\G)+y;
    err = norm(y1-y);
    y= y1;
    i = i + 1;
end

end