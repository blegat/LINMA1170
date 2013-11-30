function [dfdq] = J_2 (q)
dfdq = [4*q(1)^2+q(2)^2, 3*q(1)*q(2); 3*q(1)*q(2), q(1)^2+3*q(2)^2] / norm(q)^5;
end