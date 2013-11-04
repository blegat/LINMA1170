function [] = q3rho_method (method, Img)
figure();
r = linspace(0,0.6,12);
a = [0.1 0.2 0.25 0.3 0.4]';
rhoq3 = zeros(numel(a),numel(r));
%rhoq2 = zeros(numel(a),1);
col = ['b' 'r' 'm' 'c' 'y' 'g'];
for ia = 1:numel(a)
    %A = a(ia)
    [i1 i2 X rho] = Question2(Img, a(ia), method, 3);
    rhoq2(ia,:) = rho;
    for i = 1:numel(r)
        %R = r(i)
        [i1 i2 X rho] = Question3(Img, a(ia), r(i), method, 3);
        %[rho1 rho2] = find_rho3(Img, a(ia), r(i), method);
        rhoq3(ia,i) = max(rho);
    end
    plot(r, rhoq2(ia,1), [col(ia) '+']); hold on;
    plot(r, rhoq3(ia,:), col(ia)); hold on;
end
xlabel('r');
ylabel('\rho');
%legend('q2 a=0.1', 'q3 a=0.1', 'q2 a=0.2', 'q3 a=0.2', ...
%    'q2 a=0.25', 'q3 a=0.25', 'q2 a=0.3', 'q3 a=0.3', ...
%    'q2 a=0.4', 'q3 a=0.4', 'location', 'northwest');
saveas(gcf, ['Q3/rho' method], 'png');
end