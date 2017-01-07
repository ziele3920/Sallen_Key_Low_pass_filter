classdef SKLPF
    %SKLPF Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods(Static)
        function calculatedModel = Calculate(model) 
            mod = MSKLPF;
            mod = model;
            [f, r, c] = MSKLPF.GetData(mod);
            mod = MSKLPF.AppendVariables(mod, 6, 9);
            calculatedModel = mod;
        end
    end
    
end

