% Fourierova rada

clear all;
close all;
clc;

% cilem bude z naseho reseni (spektralni koeficienty C(k)) seskladat zpet signal x(t)
% v casove oblasti a overit, jestli odpovida zadani

% 1) definice sumy - budeme brat C(k) jen omezene od -K do +K (zvolte K dostatecne vysoke)
K = 500;    
k = -K:K;            % "poradi" koeficientu C(k)
C = (-1)            % reseni ze cvika
C (k == 0) = 1;   % nultý koeficient


%% 2) vizualizace spektra

figure(2)
subplot(211);
%Zobrazte amplitudove a fazove spektrum signalu (amplitudu a fazi koeficientu C(k))
%pro zobrazeni pouzijte funkci stem()

xlim([-10, 10]); %omezení x osy
ylim([0, 2]); %omezení y osy
grid on;
xlabel('k [-]'); %pojmenovani x osy
ylabel('Hodnoty [-]');%pojmenovani y osy
legend('|C(k)|'); 
title('Amplitudove spektrum');

subplot(212);
%pro zobrazeni pouzijte funkci stem()

xlim([-10, 10]);
ylim([-pi, pi]);
grid on;
xlabel('k [-]');
ylabel('Hodnoty [rad]')
legend('∠C(k)');
title('Fazove spektrum');

%% 3) "seskladani" koeficientu C(k) pres sumu do casove oblasti

fs = 1e4; %vzorkovaci frekvence

%vytvorte casovy vektor
t = -2:2    

T = 1;              % perioda signálu (tu musime znat)


% implementujte Fourierovu radu pro signal x (vynasobeni koeficientu C(k) s komplexnimi exponencialami a nasledne secteni)




% 4) vizualizace seskladaneho signalu
figure(3);
%pouzijte funkci plot

grid on;
xlabel('t [s]');
ylabel('Hodnoty [-]');
legend('x(t)');

% namet na doma: zkuste si pohrat s parametry
% K => cim vyssi, tim presnejsi by vysledek x(t) mel byt
% C (k == 0) => ovlivnuje stredni hodnotu a tim i "pozici" signalu na ose y

%%
%Spoctete energii a vykon signalu x