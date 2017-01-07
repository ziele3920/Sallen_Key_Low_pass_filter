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
            multiValue = 1/(4*pi()^2*f^2*r*1000*c*10^(-6));
            mod = MSKLPF.AppendVariables(mod, multiValue, multiValue);
            calculatedModel = mod;
        end
    end
    
end

