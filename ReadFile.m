function list = ReadFile(fileName)
%READFILE Summary of this function goes here
%   Detailed explanation goes here
try
    data = xlsread(fileName);
catch
    data = [];
    warndlg('File does not exist or incorrect format of file');
    return;
end
    list = Parse(data);
end

function data = Parse(dataToParse)

[x, y] = size(dataToParse);
if(y ~= 5)
    warndlg('incorrect columns number in file');    
    data = [];
    return;
end

skippedRows = 0;
data = [MSKLPF];
for i = 1:1:x
    model = ParseRow(dataToParse(i,:));
    if(isempty(model))
        skippedRows = skippedRows + 1;
        continue
    end;
    data(length(data) + 1) = model;
end
data = data(2:length(data));

end

function dataModel = ParseRow(row) 
    if(~isnumeric(row) || sum(isnan(row)>0))
        dataModel = [];
        return;
    end
    dataModel = MSKLPF;
    dataModel.fc = row(1);
    dataModel = ParseR(dataModel, row);
    if isempty(dataModel)
        dataModel = [];
        return;
    end
    
    dataModel = ParseC(dataModel, row);
    if isempty(dataModel)
        dataModel = [];
        return;
    end
    

end

function newModel = ParseR(model, row) 
    r1Index = 2;
    r2Index = 3;
    if ~xor(row(r1Index) == 0, row(r2Index) == 0)
        newModel = [];
        return;
    end
    newModel = model;
    if(row(r1Index) == 0)
        newModel.r2 = row(r2Index);
    else
        newModel.r1 = row(r1Index);
    end
end

function newModel = ParseC(model, row) 
    c1Index = 4;
    c2Index = 5;
    if ~xor(row(c1Index) == 0, row(c2Index) == 0)
        newModel = [];
        return;
    end
    newModel = model;
    if(row(c1Index) == 0)
        newModel.c2 = row(c2Index);
    else
        newModel.c1 = row(c1Index);
    end
end

