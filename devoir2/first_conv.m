function [first] = first_conv(Img, a, method)
    eps = 1e-2;
    if get_erreur3(Img,a,0,method) ~= -1
        first = 0;
    else
        first = 1;
        while get_erreur3(Img, a, first, method) == -1
            first = first * 2;
        end
        if first == 1
            min = 0;
            max = 1;
        else
            min = first / 2;
            max = first;
        end
        while max - min > eps
            mid = (max + min) / 2;
            if get_erreur3(Img, a, mid, method) == -1
                min = mid;
            else
                max = mid;
            end
        end
        first = max;
    end
end