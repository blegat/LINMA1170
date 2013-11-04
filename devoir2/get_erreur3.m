function [err] = get_erreur3 (Img, a, r, method)
% norm(Img-X,'fro') si ca converge sinon -1
[i1 i2 X] = Question3(Img, a, r, method, 0);
if i1 == 500 || i2 == 500
    err = -1;
else
    err = norm(X - Img, 'fro');
end
end
