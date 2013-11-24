    %%

A=[2 4 6;4 2 1; 6 1 2];
x(1:3) = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]';
x(4:6) = [1/sqrt(3) -1/sqrt(3) 1/sqrt(3)]';
x(7:9) = [1/sqrt(3) -1/sqrt(3) -1/sqrt(3)]';
rhoVect = [-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 ];
rhoFinal = zeros(length(x),length(rhoVect));

for j=0:3:6
    for i=1:length(rhoVect)
        
        rhoFinal(j+1:j+3,i) = RQIA(A,x(j+1:j+3)', x(7:9)',rhoVect(i));
        
    end
end

surf(rhoVect,[1, 1, 1, 2, 2, 2, 3, 3, 3],rhoFinal);

