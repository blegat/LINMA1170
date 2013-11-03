function [i1, i2, X] = Question2(Img, a, iterator, graph)
%   L = image received
%   a, k = coef T ( a/k sould be between 0 and 255)
%

k=abs(1+2*a);

[M N] = size(Img);
TL = get_T(a,k,M);
TR = get_T(a,k,N);

[i1, i2, X] = doubleSolver(Img, TL, eye(M), 0, TR, eye(N), 0, iterator, 'Q2', a, k, graph);

%NORM2 = sqrt(sum(sum((X-L).^2)))


%Norm = [norm(X-L)/norm(X) , ((1+2*a)/(1-2*a))^2*norm(Delta)/norm(A)];


% emax=0;
% for i=1:M
%     for j=1:N
%         if norm(X(i,j)-L(i,j))/L(i,j) >emax
%             emax=norm(X(i,j)-L(i,j))/L(i,j);
%         end
%     end
% end
% emax

end
