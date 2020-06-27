function varargout = CorrelacionImagenes(varargin)
% CORRELACIONIMAGENES MATLAB code for CorrelacionImagenes.fig
%      CORRELACIONIMAGENES, by itself, creates a new CORRELACIONIMAGENES or raises the existing
%      singleton*.
%
%      H = CORRELACIONIMAGENES returns the handle to a new CORRELACIONIMAGENES or the handle to
%      the existing singleton*.
%
%      CORRELACIONIMAGENES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORRELACIONIMAGENES.M with the given input arguments.
%
%      CORRELACIONIMAGENES('Property','Value',...) creates a new CORRELACIONIMAGENES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CorrelacionImagenes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CorrelacionImagenes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CorrelacionImagenes

% Last Modified by GUIDE v2.5 04-May-2017 09:23:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CorrelacionImagenes_OpeningFcn, ...
                   'gui_OutputFcn',  @CorrelacionImagenes_OutputFcn, ...
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


% --- Executes just before CorrelacionImagenes is made visible.
function CorrelacionImagenes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CorrelacionImagenes (see VARARGIN)

% Choose default command line output for CorrelacionImagenes
handles.output = hObject;
set(handles.imMuestra,'Enable','off');
set(handles.imCorr,'Enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CorrelacionImagenes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CorrelacionImagenes_OutputFcn(hObject, eventdata, handles) 
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
set(handles.imMuestra,'Enable','on');
guidata(hObject,handles)

% --- Executes on button press in imMuestra.
function imMuestra_Callback(hObject, eventdata, handles)
% hObject    handle to imMuestra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
imagen = getimage(handles.axes1);
axes(handles.axes1);
impixelinfo
[x,y,~] = impixel;
x1 = num2str(x(1));
y1 = num2str(y(1));
x2 = num2str(x(2));
y2 = num2str(y(2));
rectangle('Position', [x(1),y(1),x(2)-x(1),y(2)-y(1)], 'EdgeColor','b');
new = imcrop(imagen, [x(1),y(1),x(2)-x(1),y(2)-y(1)]);
axes(handles.axes3);
axis off;
imshow(new);
set(handles.imCorr, 'Enable','on');
guidata(hObject,handles)

% --- Executes on button press in imCorr.
function imCorr_Callback(hObject, eventdata, handles)
% hObject    handle to imCorr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
im = getimage(handles.axes1);
axes(handles.axes3);
T = getimage(handles.axes3);
[~, ~, ~] = size(im);
correlacion = normxcorr2(T(:,:,1), im(:,:,1));

%assignin(WS, 'T', T);

% binT = rgb2gray(T);
% binT = wiener2(binT,[2 2]);
% imshow(binT)
% binT = im2bw(binT);
% binT = imresize(binT, [70 45]);
% [L Ne] = bwlabel(binT);
% 
% %****
% global templatesBraille
% comp=[ ];
% for n=1:26
%     [r,c]=find(L==n);
%     i=binT(min(r):max(r),min(c):max(c));
%     muestra=imresize(i,[70 45]);
%     semej=corr2(templatesBraille{1,n},muestra);
%   
%     comp=[comp semej];
% end
% vd=find(comp==max(comp));
% %*-*-*-*-*-*-*-*-*-*-*-*-*-
% if vd==1
%     letracalculada='A';
% elseif vd==2
%     letracalculada='B';
% elseif vd==3
%     letracalculada='C';
% elseif vd==4
%     letracalculada='D';
% elseif vd==5
%     letracalculada='E';
% elseif vd==6
%     letracalculada='F';
% elseif vd==7
%     letracalculada='G';
% elseif vd==8
%     letracalculada='H';
% elseif vd==9
%     letracalculada='I';
% elseif vd==10
%     letracalculada='J';
% elseif vd==11
%     letracalculada='K';
% elseif vd==12
%     letracalculada='L';
% elseif vd==13
%     letracalculada='M';
% elseif vd==14
%     letracalculada='N';
% elseif vd==15
%     letracalculada='O';
% elseif vd==16
%     letracalculada='P';
% elseif vd==17
%     letracalculada='Q';
% elseif vd==18
%     letracalculada='R';
% elseif vd==19
%     letracalculada='S';
% elseif vd==20
%     letracalculada='T';
% elseif vd==21
%     letracalculada='U';
% elseif vd==22
%     letracalculada='V';
% elseif vd==23
%     letracalculada='W';
% elseif vd==24
%     letracalculada='X';
% elseif vd==25
%     letracalculada='Y';
% elseif vd==26
%     letracalculada='Z';
% end

%******

axes(handles.axes4);
imshow(correlacion, []);

[~, maxIndex] = max(abs(correlacion(:)));
[y, x] = ind2sub(size(correlacion), maxIndex(1));
corr_offset = [(x-size(T,2)) (y-size(T,1))];
axes(handles.axes2);
imshow(im);
hold on;
rectangle('Position', [corr_offset(1) corr_offset(2) 35 35], 'EdgeColor','b','linewidth',1);
