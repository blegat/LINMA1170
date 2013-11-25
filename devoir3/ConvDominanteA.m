%%

A=[2 4 6;4 2 1; 6 1 2];
x(1:3) = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]';
x(4:6) = [1/sqrt(3) -1/sqrt(3) 1/sqrt(3)]';
x(7:9) = [1/sqrt(3) -1/sqrt(3) -1/sqrt(3)]';
rhoFinal = zeros(length(x));

for j=0:3:6
    for i=0:3:6
        
        rhoFinal(j+1:j+3,i+1:i+3) = RQIA(A,x(j+1:j+3)', x(i+1:i+3)');
        
    end
end

plot([1, 1, 1, 2, 2, 2, 3, 3, 3],rhoFinal);

