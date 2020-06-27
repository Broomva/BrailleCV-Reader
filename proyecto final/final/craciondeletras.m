clear all , clc ,close all
I=imread('NB.PNG');
imshow(I)
g=rgb2gray(I);
imshow(g)
bw=g<200;
imshow(bw)
re=bw;
[fl re]=reglones(re);
imagen=fl;
imagen=imresize(imagen,[42,24]);
imshow(imagen)


imwrite(imagen, fullfile('/Users/ORION/Documents/UNIVERSIDAD /OCTAVO SEMESTRE/VISION ARTIFICIAL/clases matlab/proyecto final/final/imagenesnuevas', 'nb1.bmp'))

