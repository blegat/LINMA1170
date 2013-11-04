function [best] = best_r (Img, a, method)
% returns the value of r giving the test value for a given a
    eps = 1e-3;
    min = first_conv(Img, a, method);
    max = 10;
    while max - min > eps
        mid1 = (2*min + max) / 3;
        mid2 = (min + 2*max) / 3;
        err1 = get_erreur3(Img, a, mid1, method);
        err2 = get_erreur3(Img, a, mid2, method);
        if err1 < err2
            % ^ *        *
            % |       *
            % |    *
            % +---------->
            max = mid2;
        else
            % ^ *        *
            % |    *
            % |       *
            % +---------->
            min = mid1;
        end
    end
    best = max;
end