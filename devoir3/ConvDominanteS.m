    %%

A=[2 4 6;4 2 1; 6 1 2];
n = 15;
x = zeros(n);
x(1:3) = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]';
x(4:6) = [0.7071  0  0.7071]';
x(7:9) = [1/sqrt(3) -1/sqrt(3) 1/sqrt(3)]';
x(10:12) =[1 0 0]';
x(13:15) = [1/sqrt(3) -1/sqrt(3) -1/sqrt(3)]';
%muVect = [-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 ];
rhoFinal = zeros(n/3);

for j=0:3:n
         
    if(mod(j,3) == 0)
        rhoFinal((j/3)+1) = RQIS(A,x(j+1:j+3)');
    end
end

plot([1, 2, 3, 4, 5],rhoFinal);

