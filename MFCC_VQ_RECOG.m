function varargout = MFCC_VQ_RECOG(varargin)
% MFCC_VQ_RECOG MATLAB code for MFCC_VQ_RECOG.fig
%      MFCC_VQ_RECOG, by itself, creates a new MFCC_VQ_RECOG or raises the existing
%      singleton*.
%
%      H = MFCC_VQ_RECOG returns the handle to a new MFCC_VQ_RECOG or the handle to
%      the existing singleton*.
%
%      MFCC_VQ_RECOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MFCC_VQ_RECOG.M with the given input arguments.
%
%      MFCC_VQ_RECOG('Property','Value',...) creates a new MFCC_VQ_RECOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MFCC_VQ_RECOG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MFCC_VQ_RECOG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MFCC_VQ_RECOG

% Last Modified by GUIDE v2.5 21-May-2021 20:02:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MFCC_VQ_RECOG_OpeningFcn, ...
                   'gui_OutputFcn',  @MFCC_VQ_RECOG_OutputFcn, ...
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
global database
% database = load('matlab_trainning.mat');
database = load('DATATRAINNING');
database = database.database;
% End initialization code - DO NOT EDIT


% --- Executes just before MFCC_VQ_RECOG is made visible.
function MFCC_VQ_RECOG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MFCC_VQ_RECOG (see VARARGIN)

% Choose default command line output for MFCC_VQ_RECOG
handles.output = hObject;
axes(handles.axes13);
im = imread('logo.jpg');
imshow(im);
axes(handles.axes16);
img = imread('respond.jpg');
imshow(img);
axes(handles.axes17);
img1 = imread('help.jpg');
imshow(img1);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MFCC_VQ_RECOG wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MFCC_VQ_RECOG_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% t?ng s? l?y m?u
Fs=8000;
% t?o và tr? v? m?t ð?i tý?ng audiorecorder có các thu?c tính
% Bít per sample = s? bít trên m?i m?u
% 1 s? kênh
recorder=audiorecorder(Fs,16,1);

global database
for i = 1:4
    %strcat n?i chu?i
    axes(handles.axes1);
    im = imread(strcat(num2str(i),'.jpg'));
    imshow(im);
    name = cell2str(database(i,1));
    set(handles.edit4,'String',name(3:end-3));
    guidata(hObject, handles);
    yob = cell2str(database(i,2));
    set(handles.edit5,'String',yob(3:end-3));
    guidata(hObject, handles);
    contr = cell2str(database(i,3));
    set(handles.edit7,'String',contr(3:end-3));
    guidata(hObject, handles);      
    class1 = cell2str(database(i,4));
    set(handles.class,'String',class1(3:end-3));
    guidata(hObject, handles);
    phone = cell2str(database(i,5));
    set(handles.edit11,'String',phone(3:end-3));
    guidata(hObject, handles);
    mssv = cell2str(database(i,6));
    set(handles.edit6,'String',mssv(3:end-3));
    guidata(hObject, handles);   
    set(handles.edit1,'string',strcat(num2str(i),' Speak into the microphone in 3 seconds!'));
    pause(1);
    set(handles.edit1,'string',strcat(num2str(i),' Speak into the microphone in 2 seconds!'));
    pause(1);
    set(handles.edit1,'string',strcat(num2str(i),' Speak into the microphone in 1 seconds!'));
    pause(1);
    set(handles.edit1,'string','Speak now!')
    recordblocking(recorder,5);
    x = getaudiodata(recorder);
    sound(x,Fs)
    audiowrite(strcat(num2str(i),'.wav'),x,Fs);    
    axis off
    axis image
    pause(4);        
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileNames = {'1.wav', '2.wav', '3.wav', '4.wav','5.wav', '6.wav', '7.wav', '8.wav','9.wav', '10.wav'};
soundcc = {'1', '2', '3', '4','5', '6', '7', '8','9', '10'};
fileData = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
mfccData = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
vqData = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
distM = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
distances = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
%threshold = 9;  % Recognition threshold
vqpoints = 64;
global database;
for i = 1:4
    [fileData{i}, Fs] = audioread(fileNames{i});  % Read file data
    mfccData{i} = mfcc(fileData{i},Fs); % Compute MFCC
    vqData{i} = vqlbg(mfccData{i},vqpoints);  % Compute Vector Quantization
end
Fs=8000;
recorder=audiorecorder(Fs,16,1);
set(handles.edit1,'string','Speak into the microphone after 3 seconds')
pause(1);
set(handles.edit1,'string','Speak into the microphone after 2 seconds')
pause(1);
set(handles.edit1,'string','Speak into the microphone after 1 seconds')
pause(1);
set(handles.edit1,'string','Speak now!')
recordblocking(recorder,5);
newdata = getaudiodata(recorder);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=newdata;
b = fir1(34,[100/Fs 5000/Fs],'bandpass',chebwin(35,30));  
newdata = filtfilt(b,1,newdata); 


mfccN = mfcc(newdata,Fs);
vqN = vqlbg(mfccN,vqpoints);
minDist = Inf;

distIndex = 0;
for i = 1:4
distM{i} = disteu(mfccData{i}, vqN);% Distances matrix
distances{i} = sum(min(distM{i},[],2)) / size(distM{i},1);  % distances
str = fprintf('Distance to %s  \t', soundcc{i});
disp(num2str(distances{i}));
    if distances{i} < minDist
        minDist = distances{i};
        distIndex = i;
    end
end
disp("id : "+distIndex);
disp("min : "+distances{distIndex});


axes(handles.axes1);
im = imread(strcat(num2str(distIndex),'.jpg'));
imshow(im);
axes(handles.axes3);
plot(fileData{distIndex});
axes(handles.axes4);
plot(newdata);
axes(handles.axes7);
plot(mfccData{distIndex});
axes(handles.axes8);
plot(mfccN);
axes(handles.axes9);
plot(vqData{distIndex});
axes(handles.axes10);
plot(vqN);

%%hien thi ket qua
name = cell2str(database(distIndex,1));
set(handles.edit4,'String',name(3:end-3));
guidata(hObject, handles);
yob = cell2str(database(distIndex,2));
set(handles.edit5,'String',yob(3:end-3));
guidata(hObject, handles);
contr = cell2str(database(distIndex,3));
set(handles.edit7,'String',contr(3:end-3));
guidata(hObject, handles); 
class1 = cell2str(database(distIndex,4));
set(handles.class,'String',class1(3:end-3));
guidata(hObject, handles);
phone = cell2str(database(distIndex,5));
set(handles.edit11,'String',phone(3:end-3));
guidata(hObject, handles);
mssv = cell2str(database(distIndex,6));
set(handles.edit6,'String',mssv(3:end-3));
guidata(hObject, handles);


% set(handles.edit6,'String',num2str(distIndex));
% guidata(hObject, handles);




function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();

% --- Executes on button press in responds.
function responds_Callback(hObject, eventdata, handles)
% hObject    handle to responds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
run MFCC_Respond.m



function class_Callback(hObject, eventdata, handles)
% hObject    handle to class (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of class as text
%        str2double(get(hObject,'String')) returns contents of class as a double


% --- Executes during object creation, after setting all properties.
function class_CreateFcn(hObject, eventdata, handles)
% hObject    handle to class (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
% respond
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
run MFCC_Respond.m

% implement
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
run introduce.m


% --- Executes on button press in pushbutton11.

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
run MFCC_Respond.m
