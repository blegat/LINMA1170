function [Norm] = statQ2(I, a)


norm=zeros(20,2);

for i=1:20
    [k p norm(i,:)] = Question2(I, a, 'Jacobi');
end
Norm  = [0.05*sum(norm)]


end
