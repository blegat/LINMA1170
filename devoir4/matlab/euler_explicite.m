function [p, q] = euler_explicite (f_1, f_2, q_0, p_0, h, n)
m = numel(q_0);
q = zeros(m,n+1);
p = zeros(m,n+1);
q(:,1) = q_0;
p(:,1) = p_0;
% Jac1 = zeros(2,n+1);  %%%%%%%%
% Jac2 = zeros(2,n+1);  %%%%%%%%
% Jac3 = zeros(2,n+1);  %%%%%%%%
% Jac4 = zeros(2,n+1);  %%%%%%%%
for k = 1:n
    q(:,k+1) = q(:,k) + h * f_1(p(:,k));
    p(:,k+1) = p(:,k) + h * f_2(q(:,k));
%     Ju = Jacobien(q(:,k),p(:,k)); %%%%%%%%
%     eigValue = eig(Ju); %%%%%%%%
%     Jac1(1,k)=h*real(eigValue(1,1)); %%%%%%%%%%
%     Jac1(2,k)=h*imag(eigValue(1,1)); %%%%%%%%%%
%     Jac2(1,k)=h*real(eigValue(2,1)); %%%%%%%%%%
%     Jac2(2,k)=h*imag(eigValue(2,1)); %%%%%%%%%%
%     Jac3(1,k)=h*real(eigValue(3,1)); %%%%%%%%%%
%     Jac3(2,k)=h*imag(eigValue(3,1)); %%%%%%%%%%
%     Jac4(1,k)=h*real(eigValue(4,1)); %%%%%%%%%%
%     Jac4(2,k)=h*imag(eigValue(4,1)); %%%%%%%%%%

end

% figure();
% plot(Jac1(1,:), Jac1(2,:), 'b.') %%%%%%%%%%
% title('lambda1*h');
% xlabel('Re(lambda*h)');
% ylabel('Im(lambda*h)');
% figure();
% plot(Jac2(1,:), Jac2(2,:), 'b.') %%%%%%%%%%
% title('lambda2*h');
% xlabel('Re(lambda*h)');
% ylabel('Im(lambda*h)');
% figure();
% plot(Jac3(1,:), Jac3(2,:), 'b.') %%%%%%%%%%
% title('lambda3*h');
% xlabel('Re(lambda*h)');
% ylabel('Im(lambda*h)');
% figure();
% plot(Jac4(1,:), Jac4(2,:), 'b.') %%%%%%%%%%
% title('lambda4*h');
% xlabel('Re(lambda*h)');
% ylabel('Im(lambda*h)');

end












