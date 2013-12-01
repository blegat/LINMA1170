function h = H_q2(q, p, G, m_1, m_2)
q_1 = q(1:2);
q_2 = q(3:4);
p_1 = p(1:2);
p_2 = p(3:4);
h = (p_1'*p_1/m_1 + p_2'*p_2/m_2)/2 - G*m_1*m_2/norm(q_1-q_2);
end