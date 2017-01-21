function WriteFile(fileName, data )
%WRITEFILE Summary of this function goes here
%   Detailed explanation goes here

readyData = cell(length(data)+1, 5);
readyData(1,:) = {'f[Hz]', 'R1[kOhm]', 'R2[kOhm]', 'C1[uF]', 'C2[uF]'};

for i=1:length(data)
    readyData(i+1,:) = {data(i).fc, data(i).r1, data(i).r2, data(i).c1, data(i).c2};
end;

xlswrite(fileName,readyData)
end

