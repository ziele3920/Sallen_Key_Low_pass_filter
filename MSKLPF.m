classdef MSKLPF
    %MSKLPF Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        fc;
        r1;
        r2;
        c1;
        c2;
    end
    
    methods(Static)
        
        function [f, r, c] = GetData(mod) 
            f = mod.fc;
            r = MSKLPF.GetAssignedValue(mod.r1, mod.r2);
            c = MSKLPF.GetAssignedValue(mod.c1, mod.c2);      
        end
        
        function retval = GetAssignedValue(v1, v2)
            if(isempty(v1))
                retval = v2;
            else
                retval = v1;
            end
        end
        
        function retval = AppendVariables(mod, r, c)
            retval = mod;
            if(isempty(mod.r1))
                retval.r1 = r;
            else
                retval.r2 = r;
            end;
            if(isempty(mod.c1))
                retval.c1 = c;
            else
                retval.c2 = c;
            end;
        end
        
    end
    
end

