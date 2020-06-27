function letracalculada=calcularletra(muestra,num_letras)
% Computes the correlation between template and input image
% and its output is a string containing the letracalculada.
% Size of 'muestra' must be 42 x 24 pixels
% Example:
% muestra=imread('D.bmp');
% letracalculada=read_letter(muestra)
global templates
comp=[ ];
for n=1:num_letras
    semej=corr2(templates{1,n},muestra);
  
    comp=[comp semej];
end
vd=find(comp==max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-
if vd==1
    letracalculada='A';
elseif vd==2
    letracalculada='B';
elseif vd==3
    letracalculada='C';
elseif vd==4
    letracalculada='D';
elseif vd==5
    letracalculada='E';
elseif vd==6
    letracalculada='F';
elseif vd==7
    letracalculada='G';
elseif vd==8
    letracalculada='H';
elseif vd==9
    letracalculada='I';
elseif vd==10
    letracalculada='J';
elseif vd==11
    letracalculada='K';
elseif vd==12
    letracalculada='L';
elseif vd==13
    letracalculada='M';
elseif vd==14
    letracalculada='N';
elseif vd==15
    letracalculada='O';
elseif vd==16
    letracalculada='P';
elseif vd==17
    letracalculada='Q';
elseif vd==18
    letracalculada='R';
elseif vd==19
    letracalculada='S';
elseif vd==20
    letracalculada='T';
elseif vd==21
    letracalculada='U';
elseif vd==22
    letracalculada='V';
elseif vd==23
    letracalculada='W';
elseif vd==24
    letracalculada='X';
elseif vd==25
    letracalculada='Y';
elseif vd==26
    letracalculada='Z';
    %*-*-*-*-*
end

