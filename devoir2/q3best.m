clear all;
close all;
load devoir2_image;
Img = I;
a = [0.1 0.2 0.25 0.3 0.4];
rj = zeros(1,numel(a));
rgs = zeros(1,numel(a));
for ia = 1:numel(a)
    rj(ia) = best_r(Img,a(ia),'Jacobi');
    rgs(ia) = best_r(Img,a(ia),'Gauss-Seidel');
end
plot(a, rj, 'b+', a, rgs, 'g+', 'Markersize', 8);
xlabel('a');
ylabel('r');
legend('Jacobi', 'Gauss-Seidel', 'location', 'northwest');
saveas(gcf, 'Q3/best', 'png');