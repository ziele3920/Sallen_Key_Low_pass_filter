function varargout = VSKLPF(varargin)
% VSKLPF MATLAB code for VSKLPF.fig
%      VSKLPF, by itself, creates a new VSKLPF or raises the existing
%      singleton*.
%
%      H = VSKLPF returns the handle to a new VSKLPF or the handle to
%      the existing singleton*.
%
%      VSKLPF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VSKLPF.M with the given input arguments.
%
%      VSKLPF('Property','Value',...) creates a new VSKLPF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VSKLPF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VSKLPF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VSKLPF

% Last Modified by GUIDE v2.5 19-Jan-2017 21:06:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VSKLPF_OpeningFcn, ...
                   'gui_OutputFcn',  @VSKLPF_OutputFcn, ...
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


% --- Executes just before VSKLPF is made visible.
function VSKLPF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VSKLPF (see VARARGIN)
    axes(handles.axesImage);
    matlabImage = imread('./Pictures/Sallen-Key_Lowpass.png');
    image(matlabImage);
    axis off;
    axis image;

    axes(handles.axesBode);
    matlabImage = imread('./Pictures/minion.jpg');
    image(matlabImage);
    axis off;
    axis image;

    
% Choose default command line output for VSKLPF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VSKLPF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VSKLPF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editFc_Callback(hObject, eventdata, handles)
% hObject    handle to editFc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFc as text
%        str2double(get(hObject,'String')) returns contents of editFc as a double
DataValidator.IsANumber(hObject);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function editFc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR1_Callback(hObject, eventdata, handles)
% hObject    handle to editR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editR1 as text
%        str2double(get(hObject,'String')) returns contents of editR1 as a double
%DataValidator.IsANumber(hObject);
ValidateToggledField(hObject, handles.editR2);
    

% --- Executes during object creation, after setting all properties.
function editR1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR2_Callback(hObject, eventdata, handles)
% hObject    handle to editR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editR2 as text
%        str2double(get(hObject,'String')) returns contents of editR2 as a double
ValidateToggledField(hObject, handles.editR1);

% --- Executes during object creation, after setting all properties.
function editR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC1_Callback(hObject, eventdata, handles)
% hObject    handle to editC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC1 as text
%        str2double(get(hObject,'String')) returns contents of editC1 as a double
ValidateToggledField(hObject, handles.editC2);

% --- Executes during object creation, after setting all properties.
function editC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC2_Callback(hObject, eventdata, handles)
% hObject    handle to editC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC2 as text
%        str2double(get(hObject,'String')) returns contents of editC2 as a double
ValidateToggledField(hObject, handles.editC1);

% --- Executes during object creation, after setting all properties.
function editC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonCalculate.
function pushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'string','<html><FONT color="red">Kolotowy</Font><FONT color="green"> kote�</Font></html>');
if(ValidateFieldsCompletion(handles))
    SetStatusInfo(handles, 'Counting');
    model = GetModel(handles.editFc, handles.editR1, handles.editR2,handles.editC1, handles.editC2);
    try
       model = SKLPF.Calculate(model);
    catch
       warndlg('Unable to calculate your model');
       SetStatusInfo(handles, 'Idle...');
       return;
    end
    FillOutputFields(model, handles.textFc, handles.textR1, handles.textR2, handles.textC1, handles.textC2);
    axes(handles.axesBode);
    bodeplot(model.H);
    bodeplot(model.H);
    grid on;
    guidata(hObject,handles);
    SetStatusInfo(handles, 'Idle...');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function textFc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','wait for calculate');

% --- Executes during object creation, after setting all properties.
function textR1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to label1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function textR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to label2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function textC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to label3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function textC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function ValidateToggledField(hObject, hToggledObject)
    if isempty(get(hObject,'String'))
        set(hToggledObject, 'enable', 'on');
        set(hObject,'string','insert value');
    elseif (DataValidator.IsANumber(hObject))
        set(hToggledObject, 'enable', 'off');
    end

    
function retval = GetModel(fc, r1, r2, c1, c2)
    retval = MSKLPF;
    retval.fc = str2double(get(fc,'String'));
    tmp = get(r1,'String');
        if(strcmp('insert value', tmp))
            retval.r2 = str2double(get(r2,'String'));
        else
            retval.r1 = str2double(tmp);
        end
    tmp = get(c1,'String');
        if(strcmp('insert value', tmp))
            retval.c2 = str2double(get(c2,'String'));
        else
            retval.c1 = str2double(tmp);
        end
   
function FillOutputFields(model, fc, r1, r2, c1, c2)
    set(fc,'string', model.fc);
    set(r1,'string', model.r1);
    set(r2,'string', model.r2);
    set(c1,'string', model.c1);
    set(c2,'string', model.c2);
    
function retval = ValidateFieldsCompletion(handles)
    str = 'insert value';
    if(strcmp(get(handles.editFc, 'String'), str))
        retval = false;
        warndlg('Insert all necessary fields');
        return;
    end
    if(strcmp(get(handles.editR1, 'String'), str) && strcmp(get(handles.editR2, 'String'), str))
        retval = false;
        warndlg('Insert all necessary fields');
        return;
    end
    if(strcmp(get(handles.editC1, 'String'), str) && strcmp(get(handles.editC2, 'String'), str))
        retval = false;
        warndlg('Insert all necessary fields');
        return;
    end
    retval = true;
    
    function SetStatusInfo(handles, text)
        set(handles.textInfoStatus, 'string', text);
        drawnow();
    



function editInputFile_Callback(hObject, eventdata, handles)
% hObject    handle to editInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInputFile as text
%        str2double(get(hObject,'String')) returns contents of editInputFile as a double


% --- Executes during object creation, after setting all properties.
function editInputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editOutputFile_Callback(hObject, eventdata, ~)
% hObject    handle to editOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOutputFile as text
%        str2double(get(hObject,'String')) returns contents of editOutputFile as a double


% --- Executes during object creation, after setting all properties.
function editOutputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonFile.
function pushbuttonFile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(~DataValidator.IsAText(handles.editOutputFile) || ~DataValidator.IsAText(handles.editInputFile))
    return;
end
SetStatusInfo(handles, 'Loading from file...');
dataList = ReadFile(get(handles.editInputFile, 'string'));
SetStatusInfo(handles, 'Calculating...');
for i=1:length(dataList)
    try
        dataList(i) = SKLPF.Calculate(dataList(i));
        calculatedModels = [calculatedModels, dataList(i)];
    catch ex
        warning(ex.message);
    end;
end
SetStatusInfo(handles, 'Write results to file...');
WriteFile(get(handles.editOutputFile, 'string'), dataList);
SetStatusInfo(handles, 'Idle...');

