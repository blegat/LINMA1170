    %%

A=[2 4 6;4 2 1; 6 1 2];
n = 18;
x = zeros(n);
x(1:3) = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]';
x(4:6) = [0.7071  0  0.7071]';
x(7:9) = [1/sqrt(3) -1/sqrt(3) 1/sqrt(3)]';
x(10:12) =[1 0 0]';
x(13:15) = [1/sqrt(3) -1/sqrt(3) -1/sqrt(3)]';
x(16:18) = [0  -0.7071 -0.7071]';
rhoFinal = zeros(n/3,1);

for j=1:3:n
         
    if(mod(j-1,3) == 0)
        rhoFinal((j-1)/3+1) = RQIS(A,x(j:j+2)');
    end
end

plot([1, 2, 3, 4, 5, 6],rhoFinal);

