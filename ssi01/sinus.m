close all   % zavřít okna všech obrázků
clear all   % smazat všechny proměnné
clc         % smazat výstup v Command window
 
% Kreslení sinu, 4 způsoby
 
% 1. sinus se vztahem k času
fs = 8000;  % (Hz)   vzorkovací frekvence
 
f = 440;    % (Hz)   frekvence generované sinusovky
doba = .02; % (s) trvání signálu v sekundách
 
t1 = (0: doba*fs-1) / fs;   % časová osa
         % Musíme odečíst poslední vzorek, protože začínáme od nuly.
         % Krok je 1/fs, protože kdyby bylo např. fs = 10 vzorků za sekundu,
         % tak časový krok bude 1 sekunda / 10 dílků = 0.1 sekundy.
 
x1 = sin(2*pi*f*t1);   % 2*pi je perioda sin, vynásobeno frekvencí
                       % = kolikrát za sekundu se to otočí dokola,
                       % krát čas v sekundách - v jaké části zrovna jsme
 
figure;        % nový obrázek
subplot(4,1,1) % rozdělíme na panely: 4 řádky, 1 sloupec, nyní kreslit do 1. panelu
plot(t1, x1)   % ač zobrazení vypadá spojitě, signál je diskrétní: pro diskrétní zobrazení použít stem()
xlabel('---> t [s]')         % popis osy
ylabel('---> sin(\omegat)')  % psaní řeckých písmen
title('Harmonický průběh')   % titulek
grid                         % mřížka
 
 
% 2. zadaný počet vzorků signálu
vzorku = 25;
t2 = (0: vzorku - 1)/fs;
x2 = sin(2*pi*f*t2);
 
subplot 412          % zkrácený způsob zápisu subplot
stem(t2, x2)         % diskrétní vykreslení
axis([0 0.02 -1 1])  % ruční nastavení os
 
 
% 3. počet period signálu
period = 4;
t3 = (0: period/f*fs - 1)/fs;
x3 = sin(2*pi*f*t3);
% Pozn.: pozor, zde jsme si vymysleli požadavek,
% který nevede na celý počet vzorků: period/f*fs = 72.727.
% Ve skutečnosti ani předchozí dvě sinusoidy nejsou periodické ve smyslu,
% jaký známe ve spojitém čase: nevychází celý počet vzorků na periodu,
% proto je každá perioda trochu jiná. Při rekonstrukci signálu do spojité
% oblasti se však jedná o klasický periodický signál. Toto je běžné chování
% diskrétních signálů, na které si musíme zvyknout.
 
subplot 413
plot(t3, x3, '-or', 'LineWidth', 2)  % spojitá čára, kolečka v bodech,
                                     % červeně, tloušťka čáry 2
axis tight % automatické nastavení os
 
 
% 4. diskrétní sinusovka bez vztahu k času
N = 20;   % počet vzorků na periodu
P = 2;    % počet period
NN = P*N; % celkový počet vzorků
n = 0: NN - 1;   % n jsou indexy vzorků - není to čas
                 % vzorek číslo NN by patřil už do 3. periody
x4 = sin(2*pi*n/N);
 
subplot 414
stem(n, x4)
xlabel('---> n [index vzorku]')
title('Diskrétní harmonický průběh')