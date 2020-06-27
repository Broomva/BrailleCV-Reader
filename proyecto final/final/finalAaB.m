function varargout = finalAaB(varargin)
% FINALAAB MATLAB code for finalAaB.fig
%      FINALAAB, by itself, creates a new FINALAAB or raises the existing
%      singleton*.
%
%      H = FINALAAB returns the handle to a new FINALAAB or the handle to
%      the existing singleton*.
%
%      FINALAAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALAAB.M with the given input arguments.
%
%      FINALAAB('Property','Value',...) creates a new FINALAAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalAaB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalAaB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalAaB

% Last Modified by GUIDE v2.5 11-May-2017 15:19:02

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalAaB_OpeningFcn, ...
                   'gui_OutputFcn',  @finalAaB_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before finalAaB is made visible.
function finalAaB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalAaB (see VARARGIN)

% Choose default command line output for finalAaB
handles.output = hObject;
set(handles.traducir,'Enable','off');
set(handles.verpreprocerso,'Enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalAaB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = finalAaB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in imLoad.
function imLoad_Callback(hObject, eventdata, handles)
% hObject    handle to imLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[dir_carga, pathname]=uigetfile({'*.jpeg;*.jpg;*.png;*.gif'},'Abrir Documento');
axes(handles.axes1);
imagen = imread(fullfile(pathname, dir_carga));
axis off;
imshow(imagen);
set(handles.traducir,'Enable','on');
set(handles.popupmenu1,'Enable','on');
guidata(hObject,handles)

% --- Executes on button press in traducir.
function traducir_Callback(hObject, eventdata, handles)
% hObject    handle to traducir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
imagen = getimage(handles.axes1);
axes(handles.axes1);
palabra=[];
vii=[];
vi2=[];
vi3=[];
frasebraille=[];
load templates
global templates
%--------CARGAR IMAGEN-----------% 
I=imagen;
tipo=get(handles.popupmenu1,'Value');
%--------PRE PROCESO UMBRALIZACION Y SEGMENTACION-----------%
%imshow(I)
if tipo==2
    ga=rgb2gray(I);
    um=umbralOtsu(ga)*255;
    um=220;
    bw=ga<um;
    re=bw;
end

if tipo==1
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
figure, imshow('AlfabetoBraille.png')
jkl = imresize(todobraille, [100 100]);
%figure,imshow(~todobraille)

% [ty, tx]=size(todobraille)
% % ty=20*ty
% % tx=20*tx
% n=20;
% for i=1:ty
%     for j=1:tx
%         if todobraille(i,j)==0 & j==1
%             vii=[vii,ones(n,n)];
%             vi=cat(1,vii);
%         end   
%         if todobraille(i,j)==1 & j==1
%              vii=[vii,zeros(n,n)];
%               vi=cat(1,vii);
%         end
%          if todobraille(i,j)==0 & j==2
%             vi2=[vi2,ones(n,n)];
%              v2=cat(1,vi2);
%         end   
%         if todobraille(i,j)==1 & j==2
%              vi2=[vi2,zeros(n,n)];
%              v2=cat(1,vi2);
%         end
%         if todobraille(i,j)==0 & j==3
%             vi3=[vi3,ones(n,n)];
%             v3=cat(1,vi3);
%         end   
%         if todobraille(i,j)==1 & j==3
%             vi3=[vi3,zeros(n,n)];
%             v3=cat(1,vi3);
%         end
%     end
% end

m=[1 1 1 1 1 ;  1 1 -10 1 1 ;  1 1 1 1 1];
m=strel('disk',2);% todos los bordes
nueva=imdilate(todobraille,m);
%figure, imshow(nueva)
set(handles.resultado,'String',todo) 
set(handles.resbrille,'String',todobraille)
set(handles.verpreprocerso,'Enable','on');
axes(handles.axes2);
set(handles.axes2,'visible','on')
imshow(todobraille);
guidata(hObject,handles)

% --- Executes on button press in verpreprocerso.
function verpreprocerso_Callback(hObject, eventdata, handles)
% hObject    handle to verpreprocerso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes2);
set(handles.axes2,'visible','on')
imshow(re);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
contents = cellstr(get(hObject,'String')) 
tipo=contents{get(hObject,'Value')}

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
