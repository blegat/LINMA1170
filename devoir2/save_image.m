function [] = save_image (L, name, graph)
% graph: 0 just don't
%        1 export in png
%        2 just show
if graph > 0
    figure();
    if graph == 1
        set(gcf,'Visible','off');
    end
    colormap(gray);
    imagesc(L);
    axis off;
    if graph == 1
        saveas(gcf, name, 'png');
    end
end
end