function varargout = introduce(varargin)
% INTRODUCE MATLAB code for introduce.fig
%      INTRODUCE, by itself, creates a new INTRODUCE or raises the existing
%      singleton*.
%
%      H = INTRODUCE returns the handle to a new INTRODUCE or the handle to
%      the existing singleton*.
%
%      INTRODUCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTRODUCE.M with the given input arguments.
%
%      INTRODUCE('Property','Value',...) creates a new INTRODUCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before introduce_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to introduce_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help introduce

% Last Modified by GUIDE v2.5 21-May-2021 18:06:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @introduce_OpeningFcn, ...
                   'gui_OutputFcn',  @introduce_OutputFcn, ...
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


% --- Executes just before introduce is made visible.
function introduce_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to introduce (see VARARGIN)

% Choose default command line output for introduce
handles.output = hObject;
axes(handles.axes5);
im = imread('logo.jpg');
imshow(im);
axes(handles.axes1);
im = imread('1.jpg');
imshow(im);
axes(handles.axes2);
im = imread('2.jpg');
imshow(im);
axes(handles.axes3);
im = imread('4.jpg');
imshow(im);
axes(handles.axes4);
im = imread('3.jpg');
imshow(im);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes introduce wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = introduce_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run MFCC_VQ_RECOG.m
closereq();
