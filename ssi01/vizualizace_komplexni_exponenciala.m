clear all;
close all;
clc;

%% definice amplitudy a komplexni frekvence
A = 3 + 3j;
s = -1 + 5j;

%% volba casu - vytvorte casovy vektor od 0 do 10 sekund
t = linspace(0, 10, 1e3);
                                
%% definice cmplx. exponenciely
x = A*exp(s*t);

%% vizualizace - zobrazte realnou a imaginarni cast
figure(1);
%pouzijte funkci plot
plot(x)

%pojmenovani os
xlabel('Re·ln· Ë·st x(t) [-]');
ylabel('Imagin·rnÌ Ë·st x(t) [-]');


%% vizualizace 3D - zobrazte realnou a imaginarni cast v case
figure(2);
%pouzijte funkci plot3
plot3(t, real(x), imag(x));

%pojmenovani os
xlabel('Re·ln· Ë·st x(t) [-]');
ylabel('Imagin·rnÌ Ë·st x(t) [-]');
zlabel('time [s]')
%% vykresleni vyvoje realne casti exponenciely v case 0 az 10 s
            
% vizualizace
figure(3);
plot(t, real(x));

%pojmenovani os
xlabel('»as [s]');
ylabel('Re·ln· Ë·st x(t) [-]');


%% vykresleni vyvoje imaginarni casti exponenciely v case 0 az 10 s
figure(4);
plot(t, imag(x))

%pojmenovani os
xlabel('»as [s]');
ylabel('Imagin·rnÌ Ë·st x(t) [-]');