 % 7. ukol z 1. tydne

clear all;
close all;
clc;

%% vykresleni imaginarni proti realne casti
A = 3 + 3j;
s = -1 + 5j;

% volba casu
t = linspace(0, 10, 1e3);       % volba okraju casove osy tu neni tak podstatna... 
                                % V case 0 ale bude graf zacinat pekne v bode A = 1 + 2j
                                % a s rostoucim casem by vznikly "hlemyzd" mel 
                                % (diky zaporne realne casti tlumeni) klesat k nule
                                
% definice cmplx. exponenciely
x = A*exp(s*t);

% vizualizace
figure(1);
plot(real(x), imag(x));
xlabel('Re·ln· Ë·st x(t) [-]');
ylabel('Imagin·rnÌ Ë·st x(t) [-]');


% vizualizace 3D
figure(2);
plot3(t, real(x), imag(x));
xlabel('Re·ln· Ë·st x(t) [-]');
ylabel('Imagin·rnÌ Ë·st x(t) [-]');

%% vykresleni vyvoje realne casti exponenciely v case 0 az 2 s

% vizualizace
figure(3);
plot(t, real(x));
xlabel('»as [s]');
ylabel('Re·ln· Ë·st x(t) [-]');


%% vykresleni vyvoje imaginarni casti exponenciely v case 0 az 2 s
figure(4);
plot(t, imag(x));
xlabel('»as [s]');
ylabel('Imagin·rnÌ Ë·st x(t) [-]');