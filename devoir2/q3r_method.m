function [] = q3r_method (method, Img)
figure();
r = linspace(0,0.6,12);
a = [0.1 0.2 0.25 0.3 0.4]';
e = zeros(numel(a),numel(r));
last_fail = zeros(numel(a),1);
eq2 = zeros(numel(a),1);
col = ['b' 'r' 'm' 'c' 'y' 'g'];
for ia = 1:numel(a)
    err = get_erreur2(Img, a(ia), method);
    eq2(ia,1) = err;
    for i = 1:numel(r)
        err = get_erreur3(Img, a(ia), r(i), method);
        if err == -1
            last_fail(ia) = i;
        else
            e(ia,i) = err;
        end
    end
    plot(mean(r), eq2(ia,1), [col(ia) '+'], 'Markersize', 8); hold on;
    no_fail = last_fail(ia)+1:numel(r);
    plot(r(no_fail), e(ia,no_fail), col(ia), 'Linewidth', 2); hold on;
end
xlabel('r');
ylabel('erreur');
legend('q2 a=0.1', 'q3 a=0.1', 'q2 a=0.2', 'q3 a=0.2', ...
    'q2 a=0.25', 'q3 a=0.25', 'q2 a=0.3', 'q3 a=0.3', ...
    'q2 a=0.4', 'q3 a=0.4', 'location', 'northwest');
saveas(gcf, ['Q3/ar' method], 'png');
end