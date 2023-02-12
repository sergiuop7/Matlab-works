%Boundaries extraction in Matlab

im = imread('circles.png'); % loading of the image in Matlab
imshow(im)

% image binarization (as a result of this operation the objects should be white and the background black)
if (~islogical(im))
if (ndims(im)>2), im = rgb2gray(im); end
level=graythresh(im); BW = im2bw(im, level);
else
    BW = im;
end
figure, imshow(BW)
% if after this step the background is white and the objects are black, the image needs to be complemented
% BW = ~BW;
% figure, imshow(BW)

% image segmentation and boundary extraction
[B,L,N] = bwboundaries(BW, 'noholes');
% N - number of objects found in the image;
% B - structure containing the boundary of each object;
% L - the label matrix

% displaying the boundary of each object in the image
for (k=1:N)
    X = B{k}(:,2);
    Y = B{k}(:,1);
    contur = [X'; Y'];
    figure, plot(X, Y)
end