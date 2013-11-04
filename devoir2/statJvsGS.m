function [y1] = statJvsGS(Img, iterator)
r=linspace(0.1,1,20);
a=linspace(0.1,1,20);

y1=zeros(20,20);
y2=zeros(20,20);
for i=1:20
    for j=1:20
       [y1(i,j) y2(i,j)] = Question3(Img, a(i), r(j), iterator, 0); 
    end
    1
end

surface(a,r,y2); xlabel('r'); ylabel('a');

end

