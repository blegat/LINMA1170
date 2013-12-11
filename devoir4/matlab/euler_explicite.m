function [p, q] = euler_explicite (f_1, f_2, q_0, p_0, h, n)
m = numel(q_0);
q = zeros(m,n+1);
p = zeros(m,n+1);
q(:,1) = q_0;
p(:,1) = p_0;
for k = 1:n
    q(:,k+1) = q(:,k) + h * f_1(p(:,k));
    p(:,k+1) = p(:,k) + h * f_2(q(:,k));
end

end












