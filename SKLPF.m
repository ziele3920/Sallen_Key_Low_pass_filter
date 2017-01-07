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
            [nr, nc] = SKLPF.CountValues(multiValue);
            mod = MSKLPF.AppendVariables(mod, nr*10^(-3), nc*10^6);
            mod = SKLPF.CountTransferFnc(mod);
            calculatedModel = mod;
        end
        
        function [r, c] = CountValues(multiValue)
            c = 1;
            minR = 10^3;
            maxR = 5*10^5;
           while(c > 5 * 10^(-5))
               r = randi([minR, maxR]);
               c = multiValue/r;
           end
        end
        
        function newModel = CountTransferFnc(model)
           newModel = model;
           omega = 2*pi()*model.fc;
           alpha = 1/model.c1 * ((model.r1 + model.r2)/(model.r1 * model.r2));
           newModel.H = tf([omega^2], [1 alpha omega^2]);
        end
    end
    
end

