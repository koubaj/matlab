% Fourierova rada

clear all;
close all;
clc;

% cilem bude z naseho reseni (spektralni koeficienty C(k)) seskladat zpet signal x(t)
% v casove oblasti a overit, jestli odpovida zadani

% 1) definice sumy - budeme brat C(k) jen omezene od -K do +K (zvolte K dostatecne vysoke)
K = 100;    
k = -K:K;        % "poradi" koeficientu C(k) od -K do K
C = j./(2*pi*k);             % reseni ze cvika
C (k == 0) = 1/2;   % nultý koeficient


%% 2) vizualizace spektra

figure(2)
subplot(211);
%Zobrazte amplitudove a fazove spektrum signalu (amplitudu a fazi koeficientu C(k))
%pro zobrazeni pouzijte funkci stem()
stem(k, abs(C))
xlim([-10, 10]); %omezení x osy
ylim([0, 1]); %omezení y osy
grid on;
xlabel('k [-]'); %pojmenovani x osy
ylabel('Hodnoty [-]');%pojmenovani y osy
legend('|C(k)|'); 
title('Amplitudove spektrum');

subplot(212);
%pro zobrazeni pouzijte funkci stem()
stem(k,angle(C))
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
t = -2 : 1/fs : 2 - 1/fs;    

T = 1;              % perioda signálu (tu musime znat)


% implementujte Fourierovu radu pro signal x (vynasobeni koeficientu C(k) s komplexnimi exponencialami a nasledne secteni)

x = zeros(1, length(t));


for n = 1:length(C) % projedou se vsechny C(k) a jejich "prispevek" se pricte k x(t)
    x = x + C(n)*exp(1j*2*pi*k(n)*t./T); % z definice F.R. (2pi/T je prepocet na omegu)
end


% 4) vizualizace seskladaneho signalu
figure(3);
%pouzijte funkci plot
plot(t,x)
grid on;
xlabel('t [s]');
ylabel('Hodnoty [-]');
legend('x(t)');

% namet na doma: zkuste si pohrat s parametry
% K => cim vyssi, tim presnejsi by vysledek x(t) mel byt
% C (k == 0) => ovlivnuje stredni hodnotu a tim i "pozici" signalu na ose y

%%
%Spoctete energii a vykon signalu x
energie = sum(abs(x).^2)
vykon = mean(abs(x).^2)
