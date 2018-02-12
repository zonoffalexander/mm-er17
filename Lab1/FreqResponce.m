function [K, f] = FreqResponce(R, C, F_min, F_max, nF) 
% K - , f - 
% R - , C -
% F_min, F_max, nF
    f = F_min:((F_max-F_min)/nF):F_max;

    K = nan(1, length(f));
    for j = 1:length(f)
        Tmod = 2 / f(j);  % FIXME
        T_d = Tmod / 1000; % FIXME
        t = 0:T_d:Tmod; 
        nT = floor(Tmod/T_d) + 1;
    
        E = sin(2*pi*f(j)*t);
    
        U_c = LowPassRC(R, C, T_d, nT, E); 
        U = U_c(fix(end / 2):end);
        K(j)=(max(U_c) - min(U_c))/2;
    end