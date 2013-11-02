function [] = find_r (Img, a, iterator)
r = linspace(0,0.5,10);
e = r;
for i = 1:numel(r)
    [i1 i2 X] = Question3(Img, a, r(i), iterator, 0);
    e(i) = norm(X - Img, 'fro');
end
figure(a*100)
plot(r, e);
end