clear all , clc ,close all
palabra=[];
frasebraille=[];
load templates
global templates

%--------CARGAR IMAGEN-----------%
I=imread('TEST_1.JPG');
%I=imread('MIG.PNG');
I=imread('T1.PNG');
 info = imfinfo('TEST_1.JPG');
 info.Format
c=1;% real 
c=0;% pc

%--------PRE PROCESO UMBRALIZACION Y SEGMENTACION-----------%
%imshow(I)
if c==0
    ga=rgb2gray(I);
    um=umbralOtsu(ga)*255
    bw=ga<um;
    
    re=bw;
end

if c==1
    ga=rgb2gray(I);
    um=umbralOtsu(ga)*255
    bw=ga<um;
    
    %--------PROCESO MEJORA LA CALIDAD-----------%
    m=strel('disk',1); % mascara general
    m2=strel('disk',2); % mascara general
    pda=imdilate(bw,m);
    pea=imerode(pda,m2);
    pda2=imdilate(pea,m);
    bw=pda2;
    re=bw;
end
figure, imshow(re)
%--------CALCULO DE LETRA-----------%
num_letras=size(templates,2);
p=0;
while 1
    p=p+1;
    [fl re]=reglones(re);
    letra=fl;
   %imshow(fl); pause(0.5) 
    
    [L Ne] = bwlabel(letra);
    %figure, imshow(label2rgb(L))
   for n=1:Ne % hasta el numero de letras 
        [r,c]=find(L==n);
        i=letra(min(r):max(r),min(c):max(c)); 
        %figure,imshow(i)      
        muestra=imresize(i,[42 24]);      
        %figure,imshow(muestra)      
        letracalculada=calcularletra(muestra,num_letras);
        BRAILLE=pasarbraille(letracalculada);
        palabra=[palabra,letracalculada];
        frasebraille=[frasebraille,BRAILLE];
   end
   
   todo(p,1)=cellstr(palabra);
   palabra=[];
   todobraille=cat(1,frasebraille);
   
    if isempty(re) 
        break
    end    
end

todobraille
todo

figure,imshow(~todobraille)


 