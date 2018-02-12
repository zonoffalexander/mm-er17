clc;
% Номиналы элементов
R = 220; C = 33*10^(-12);
% 
T_d = R * C / 100; nT = 1000;
% Воздействие на цепь
Noise = 7 * randn(1, nT);
E = 10 * ones(1, nT);

[U_c, t] = LowPassRC(R, C, T_d, nT, E);
[U_noise, t] = LowPassRC(R, C, T_d, nT, Noise);
[K, f] = FreqResponce(R, C, 10^3, 10^8, 100);

figure(1);
plot(t, [U_noise; Noise]);

figure(2);
subplot(1, 2, 1), plot(t, [U_c; E]), grid on;
subplot(1, 2, 2), plot(f, K), grid on;