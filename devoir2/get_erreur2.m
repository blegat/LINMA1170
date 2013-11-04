function [err] = get_erreur2 (Img, a, method)
% norm(Img-X,'fro') si ça converge sinon -1
    [i1 i2 X] = Question2(Img, a, method, 0);
    if i1 == 500 || i2 == 500
        err = -1;
    else
        err = norm(X - Img, 'fro');
    end
end