clear all;
load devoir2_image;
Img = I;
r = linspace(0,0.6,12);
fail_e = 1600;
a = [0.1 0.2 0.25 0.3 0.4 0.45]';
e = zeros(numel(a),numel(r));
col = ['b' 'r' 'm' 'c' 'y' 'g'];
for ia = 1:numel(a)
    e = r;
    for i = 1:numel(r)
        [i1 i2 X] = Question3(Img, a(ia), r(i), 'Jacobi', 0);
        if i1 == 500 || i2 == 500
            e(ia,i) = fail_e;
        else
            e(ia,i) = norm(X - Img, 'fro');
        end
    end
    plot(r, e(ia,:), col(ia)); hold on;
end
legend('a=0.1', 'a=0.2', 'a=0.25', 'a=0.3', 'a=0.4', 'a=0.5');
saveas(gcf, 'Q3/ar', 'png');