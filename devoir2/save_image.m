function [] = save_image (L, name)
figure();
set(gcf,'Visible','off');
colormap(gray);
imagesc(L);
axis off;
saveas(gcf, name, 'png');
end