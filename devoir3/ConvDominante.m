    %%

A=[2 4 6;4 2 1; 6 1 2];
x(1:3) = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]';
x(4:6) = [1/sqrt(3) -1/sqrt(3) 1/sqrt(3)]';
x(7:9) = [1/sqrt(3) -1/sqrt(3) -1/sqrt(3)]';
muVect = [-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 ];
muFinal = zeros(3,length(muVect))

for j=0:3:6
    for i=1:length(muVect)
        
        muFinal(j+1:j+3,i) = RQIS(A,x(j+1:j+3)',muVect(i));
        
    end
end

x
muVect
muFinal
surf(muVect,[1, 1, 1, 2, 2, 2, 3, 3, 3],muFinal);

