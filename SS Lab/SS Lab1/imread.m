clear variables;

I = imread('peppers.png'); I=rgb2gray(I);
figure, imshow(I)
[x,y] = meshgrid(1:size(I,2), I:size(I,1));
figure, surf(x,y,double(I)), shading flat, colormap gray