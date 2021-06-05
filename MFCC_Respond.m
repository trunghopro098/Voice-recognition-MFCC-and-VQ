function varargout = MFCC_Respond(varargin)
% MFCC_RESPOND MATLAB code for MFCC_Respond.fig
%      MFCC_RESPOND, by itself, creates a new MFCC_RESPOND or raises the existing
%      singleton*.
%
%      H = MFCC_RESPOND returns the handle to a new MFCC_RESPOND or the handle to
%      the existing singleton*.
%
%      MFCC_RESPOND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MFCC_RESPOND.M with the given input arguments.
%
%      MFCC_RESPOND('Property','Value',...) creates a new MFCC_RESPOND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MFCC_Respond_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MFCC_Respond_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MFCC_Respond

% Last Modified by GUIDE v2.5 21-May-2021 20:13:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MFCC_Respond_OpeningFcn, ...
                   'gui_OutputFcn',  @MFCC_Respond_OutputFcn, ...
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


% --- Executes just before MFCC_Respond is made visible.
function MFCC_Respond_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MFCC_Respond (see VARARGIN)

% Choose default command line output for MFCC_Respond
handles.output = hObject;
axes(handles.axes1);
im = imread('muiten.jpg');
imshow(im);
axes(handles.axes2);
im = imread('muiten.jpg');
imshow(im);
axes(handles.axes3);
im = imread('muiten.jpg');
imshow(im);
axes(handles.axes4);
im = imread('tennguoc.jpg');
imshow(im);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MFCC_Respond wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MFCC_Respond_OutputFcn(hObject, eventdata, handles) 
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
global voice1
fs=12000;
objRecord = audiorecorder(fs,16,1);%thieeta l?p t?ng s?(t?c ð?) l?y m?u
% 16 s? bit trên 1 m?u, 1 s? kênh
set(handles.edit2,'string','Ready to recording')
pause(3);
set(handles.edit2,'string','Recording now')
recordblocking(objRecord,5);  % speak for 1 second
voice1 = getaudiodata(objRecord);%Lýu tr? tín hi?u âm thanh ð? ghi trong m?ng s?
audiowrite('11.wav',voice1,fs);%lýu âm voicel
set(handles.edit2,'string','Done recording')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice_res1
fs=12000;
objRecord = audiorecorder(fs,16,1);
set(handles.edit5,'string','Ready to recording')
pause(3);
set(handles.edit5,'string','Recording now')
recordblocking(objRecord,5);  % speak for 5 second
voice_res1 = getaudiodata(objRecord);
audiowrite('11_res.wav',voice_res1,fs);
set(handles.edit5,'string','Done recording')
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice2
fs=12000;
objRecord = audiorecorder(fs,16,1);
set(handles.edit3,'string','Ready to recording')
pause(3);
set(handles.edit3,'string','Recording now')
recordblocking(objRecord,5);  % speak for 1 second
voice2 = getaudiodata(objRecord);
audiowrite('22.wav',voice2,fs);
set(handles.edit3,'string','Done recording')

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice_res2
fs=12000;
objRecord = audiorecorder(fs,16,1);
set(handles.edit6,'string','Ready to recording')
pause(3);
set(handles.edit6,'string','Recording now')
recordblocking(objRecord,5);  % speak for 5 second
voice_res2 = getaudiodata(objRecord);
audiowrite('22_res.wav',voice_res2,fs);
set(handles.edit6,'string','Done recording')

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice3
fs=12000;
objRecord = audiorecorder(fs,16,1);
set(handles.edit4,'string','Ready to recording')
pause(3);
set(handles.edit4,'string','Recording now')
recordblocking(objRecord,5);  % speak for 1 second
voice3 = getaudiodata(objRecord);
audiowrite('33.wav',voice3,fs);
set(handles.edit4,'string','Done recording')

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice_res3
fs=12000;
objRecord = audiorecorder(fs,16,1);
set(handles.edit7,'string','Ready to recording')
pause(3);
set(handles.edit7,'string','Recording now')
recordblocking(objRecord,5);  % speak for 5 second
voice_res3 = getaudiodata(objRecord);
audiowrite('33_res.wav',voice_res3,fs);
set(handles.edit7,'string','Done recording')


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice4
fs=12000;
objRecord = audiorecorder(fs,16,1);
set(handles.edit8,'string','Ready to recording')
pause(1);
set(handles.edit8,'string','Recording now')
recordblocking(objRecord,4);  % speak for 1 second
voice4 = getaudiodata(objRecord);
audiowrite('test.wav',voice4,fs);
set(handles.edit8,'string','Done recording')

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global voice1
global voice2
global voice3
global voice4
global minIndex
global voice_res1
global voice_res2
global voice_res3
fs = 12000;
Fs=12000;
mfcc1 = mfcc(audioread('11.wav'),fs);

vqData1 = vqlbg(mfcc1,64);

mfcc2 = mfcc(audioread('22.wav'),fs);
vqData2 = vqlbg(mfcc2,64);
mfcc3 = mfcc(audioread('33.wav'),fs);
vqData3 = vqlbg(mfcc3,64);

new=audioread('test.wav');
%b = fir1(34,[100/Fs 5000/Fs],'bandpass',chebwin(35,30));    % FIR filter design
%new = filtfilt(b,1,new); 
mfcc4 = mfcc(new,fs);
vqData4 = vqlbg(mfcc4,64);

minDistance = Inf;

minIndex = 0;

distanceMat1 = disteu(mfcc1,vqData4);
distanceMat2 = disteu(mfcc2,vqData4);
distanceMat3 = disteu(mfcc3,vqData4);
distances1 = sum(min(distanceMat1,[],2)) / size(distanceMat1,1); %ð? dài kích thý?t th? 1 c?a dist1 
distances2 = sum(min(distanceMat2,[],2)) / size(distanceMat2,1); 
distances3 = sum(min(distanceMat3,[],2)) / size(distanceMat3,1); 
disp("s? hàng mfcc : "+size(mfcc1,1));
disp("s? c?t mfcc : "+size(mfcc1,2));
disp("s? hàng vq  : "+size(vqData1,1));
disp("s? c?t vq : "+size(vqData1,2));
disp("s? hàng dist : "+size(distanceMat1,1));
disp("s? c?t dist : "+size(distanceMat1,2));
if distances1 < minDistance
    minDistance = distances1
    minIndex = 1
end
if distances2 < minDistance
    minDistance = distances2
    minIndex = 2
end
if distances3 < minDistance
    minDistance = distances3
    minIndex = 3
end

if minIndex == 1
    sound(audioread('11_res.wav'),fs)
end
if minIndex == 2
    sound(audioread('22_res.wav'),fs)
end
if minIndex == 3
    sound(audioread('33_res.wav'),fs)
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice1
fs = 12000
sound(audioread('11.wav'),fs)

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice2
fs = 12000
sound(audioread('22.wav'),fs)

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice3
fs = 12000
sound(audioread('33.wav'),fs)

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice_res1
fs = 12000
sound(audioread('11_res.wav'),fs)

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice_res2
fs = 12000
sound(audioread('22_res.wav'),fs)

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice_res3
fs = 12000
sound(audioread('33_res.wav'),fs)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global voice4
fs = 12000
sound(voice4,fs)

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global minIndex
global voice_res1
global voice_res2
global voice_res3
fs = 12000
if minIndex == 1
    sound(audioread('11_res.wav'),fs)
end
if minIndex == 2
    sound(audioread('22_res.wav'),fs)
end
if minIndex == 3
    sound(audioread('33_res.wav'),fs)
end

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
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
run MFCC_VQ_RECOG.m
