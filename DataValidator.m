classdef DataValidator
    %DATAVALIDATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods(Static)
        
        function retval = IsANumber(src)
            str=get(src,'String');
            number = str2num(str);
            if (isempty(number) || number <= 0)
                set(src,'string','insert value');
                warndlg('Input must be positive number');
                retval = false;
                return;
            end;
            retval = true;
        end;
        
        function retval = IsAText(src)
            str=get(src,'String');
            if (isempty(str) || strcmp(str, 'insert value'))
                set(src,'string','insert value');
                warndlg('Insert correct file name');
                retval = false;
                return;
            end;
            retval = true;
        end;
        
        
    end
    
end

