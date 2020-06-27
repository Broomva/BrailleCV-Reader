clear all , clc ,close all
palabra=[];
frasebraille=[];
load templates
global templates

I=imread('u.png');
 %
%I=imread('p2.PNG');
%I=imread('letrasmuestra.PNG');

%imshow(I)
um=200;
ga=rgb2gray(I);
bw=ga<um;
%figure, imshow(bw)

% proceso 
 m=strel('disk',1); % mascara general
 m2=strel('disk',2); % mascara general
% 
pda=imdilate(bw,m);
pea=imerode(pda,m2);
pda2=imdilate(pea,m);
bw=pda2;
%figure, imshow(pda2)
%figure, imshow(label2rgb(L))
% prop=regionprops(L,'BoundingBox');
re=bw;


% Compute the number of letters in template file
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
      
      muestra=imresize(i,[70 45]);
      
      %figure,imshow(muestra)
      
      letracalculada=calcularletra(muestra,num_letras);
             if letracalculada=='A'
                letracalculada
            BRAILLE=[1 0 ; 0 0 ; 0 0]
            elseif letracalculada=='B'
                letracalculada
            BRAILLE=[1 0 ; 1 0 ; 0 0]
            elseif letracalculada=='C'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 0 0]
            elseif letracalculada=='D'
                letracalculada
            BRAILLE=[1 1 ; 0 1 ; 0 0]
            elseif letracalculada=='E'
                letracalculada
            BRAILLE=[1 0 ; 0 1 ; 0 0]
            elseif letracalculada=='F'
                letracalculada
            BRAILLE=[1 1 ; 1 0 ; 0 0]
            elseif letracalculada=='G'
                letracalculada
            BRAILLE=[1 1 ; 1 1 ; 0 0]
            elseif letracalculada=='H'
                letracalculada
            BRAILLE=[1 0 ; 1 1 ; 0 0]
            elseif letracalculada=='I'
                letracalculada
            BRAILLE=[0 1 ; 1 0 ; 0 0]
            elseif letracalculada=='J'
                letracalculada
            BRAILLE=[0 1 ; 1 1 ; 0 0]
            elseif letracalculada=='K'
                letracalculada
            BRAILLE=[1 0 ; 0 0 ; 1 0]
            elseif letracalculada=='L'
                letracalculada
            BRAILLE=[1 0 ; 1 0 ; 1 0]
            elseif letracalculada=='M'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 1 0]
            elseif letracalculada=='N'
                letracalculada
            BRAILLE=[1 1 ; 0 1 ; 1 0]
            elseif letracalculada=='O'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 0 0]
            elseif letracalculada=='P'
                letracalculada
            BRAILLE=[1 1 ; 1 0 ; 1 0]
            elseif letracalculada=='Q'
                letracalculada
            BRAILLE=[1 1 ; 1 1 ; 1 0]
            elseif letracalculada=='R'
                letracalculada
            BRAILLE=[1 1 ; 1 1 ; 1 0]
            elseif letracalculada=='S'
                letracalculada
            BRAILLE=[0 1 ; 1 0 ; 1 0]
            elseif letracalculada=='T'
                letracalculada
            BRAILLE=[0 1 ; 1 1 ; 1 0]
            elseif letracalculada=='U'
                letracalculada
            BRAILLE=[1 0; 0 0 ; 1 1]
            elseif letracalculada=='V'
                letracalculada
            BRAILLE=[1 0 ; 1 0 ; 1 1]
            elseif letracalculada=='W'
                letracalculada
            BRAILLE=[0 1; 0 1 ; 0 1]
            elseif letracalculada=='X'
                letracalculada
            BRAILLE=[1 1 ; 0 0 ; 1 1]
            elseif letracalculada=='Y'
                letracalculada
            BRAILLE=[1 1 ; 0 1 ; 1 1]
            elseif letracalculada=='Z'
                letracalculada
            BRAILLE=[1 0 ; 0 1 ; 1 1]
             end

     %pw=strcat(pw,letracalculada)
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

todo
%todobraille


% 
% for n=1:length(prop)
%     %rectangle('Position',prop(n).BoundingBox,'EdgeColor','r')
%     [r,c]=find(L==n);
%     i=bw(min(r):max(r),min(c):max(c)); 
%     figure,imshow(i)
%   end
 