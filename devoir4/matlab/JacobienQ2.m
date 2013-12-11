function [J] = JacobienQ2(q,p,G, m1, m2)

q1=q(1:2);
q2=q(3:4);
p1=p(1:2);
p2=p(3:4);

df2dq = (1/(norm(q1-q2) ^5))* [G*m2*(2*(q1(1)-q2(1))^2 - (q1(2)-q2(2))^2) ,    3*G*m2*(q1(1)-q2(1))*(q1(2)-q2(2)) , G*m2*(-2*(q1(1)-q2(1))^2 + (q1(2)-q2(2))^2),    3*G*m2*(q1(1)-q2(1))*(q1(2)-q2(2));
    3*G*m2*(q1(1)-q2(1))*(q1(2)-q2(2)), G*m2*(2*(q1(2)-q2(2))^2 - (q1(1)-q2(1))^2),  3*G*m2*(q1(1)-q2(1))*(q1(2)-q2(2)), G*m2*(-2*(q1(2)-q2(2))^2 + (q1(1)-q2(1))^2);
    -G*m1*(2*(q1(1)-q2(1))^2 - (q1(2)-q2(2))^2) ,    -3*G*m1*(q1(1)-q2(1))*(q1(2)-q2(2)) , -G*m1*(-2*(q1(1)-q2(1))^2 + (q1(2)-q2(2))^2),    -3*G*m1*(q1(1)-q2(1))*(q1(2)-q2(2));
    -3*G*m1*(q1(1)-q2(1))*(q1(2)-q2(2)), -G*m1*(2*(q1(2)-q2(2))^2 - (q1(1)-q2(1))^2),    -3*G*m1*(q1(1)-q2(1))*(q1(2)-q2(2)), -G*m1*(-2*(q1(2)-q2(2))^2 + (q1(1)-q2(1))^2)   ];

J= [zeros(4,4), eye(4);
    df2dq, zeros(4,4)];

end

