function dpdt = f_2_q2 (q, G, m_1, m_2)
q_1 = q(1:2);
q_2 = q(3:4);
qq = norm(q_1 - q_2)^3;
dpdt = G * [-m_2*(q_1-q_2) / qq; m_1*(q_1-q_2) / qq];
end