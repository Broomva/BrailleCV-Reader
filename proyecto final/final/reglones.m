function [fl re]=reglones(im)

im=clipt(im);
%figure, imshow(im)%Crops image
num_filas=size(im,1);


        for s=1:num_filas
            if sum(im(s,:))==0
                nm=im(1:s-1, :); % First line matrix
                %imshow(nm)
                rm=im(s:end, :);% Remain line matrix
                fl= clipt(nm);
               % imshow(fl)
                re= clipt(rm);
                %*-*-*Uncomment lines below to see the result*-*-*-*-
        %                 subplot(2,1,1);imshow(fl);
        %                 subplot(2,1,2);imshow(re);
                break
            else
                fl=im;%Only one line.
                re=[ ];
            end
        end

function img_out=clipt(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));
%figure, imshow(img_out)%Crops image
