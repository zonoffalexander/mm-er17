function [U_c, t] = LowPassRC(R, C, T_d, nT, E)
    tau = R * C;            % Постоянная времени
    
    % Выделение памяти
    U_c = nan(1, nT); dU_c = nan(1, nT);
    U_r = nan(1, nT); i = nan(1, nT);
    
    % Начальные значения отсчётов
    U_c(1) = 0; U_r(1) = E(1);
    i(1) = U_r(1) / R; dU_c(1) = i(1) / C;
    
    for k = 2:nT
        U_r(k) = E(k) - U_c(k - 1);
        i(k) = U_r(k) / R;
        dU_c(k) = i(k) / C;
        U_c(k) = U_c(k - 1) + dU_c(k) * T_d;
    end
    
    t = 0:T_d:((nT - 1) * T_d);
end