% zakladni charakteristiky signalu
clear all;
close all;
clc;


%% spravna tvorba a vizualizace signalu
% 1) definice casove osy
fs = 8;          % [Hz]
t_start = 0;      % [s]
t_end = 5;         % [s]
t = t_start : 1/fs : t_end - 1/fs;

% 2) definice signalu
f0 = 5;             % [Hz]


y = 2*cos(2*pi*f0*t);

% 3) vizualizace
figure(1);
plot(t, y);

xlabel('Cas [s]');
ylabel('Hodnoty [-]');
legend('Funkce');
title('Muj prvni graf');
grid on;

%%
E = sum(y.^2);
P = E/(length(y));
P = mean(y.^2);

fprintf("Vykon je: %0.2f\n", vykon(y))