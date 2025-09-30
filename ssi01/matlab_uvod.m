% uvodni skript do matlabu

clear all;                  % kouzelne formule
close all;
clc;

%% zakladni typy cisel
1
1.23
5e6                         % pet krat deset na sestou
2e-3                        % dve krat deset na minus treti
i                           % kom1:plexni jednotka
j                           % komplexni jednotka
3 + 5j

% zavedeni promennych a potlaceni vypisu
a = 1.23;
b = 3 + 5j;
ans                         % defaultni promenna s poslednim vysledkem
clear a;                    % zahubi promennou 'a'

% pozor !!!
j = 5                       % zavedeni promenne 'j', ve ktere bude ulozena petka
j                           % uz to neni komplexni jednotka!!!!
1j                          % bezpecne :)
3 + 5j                      % tohle dal funguje :)


%% vektory a matice
a = [1, 2, 3, 4]            % radek
b = [1; 2; 3; 4]            % sloupec
c = [1, 2, 3, 4; 5, 6, 7, 8]
d = [1 2 3 4                % graficky uhlazeny zapis
    5 6 7 8]

% generovani jednoduchych vektoru
1:10
1:2:11                      % operator ':' je v matlabu hodne fajn vec. Lze jej prelozit jako 'od - do'
linspace(1, 10, 20)         % funkce linspace - 20 cisel v rozmezi 1 az 10

% generovani ruznych matic o 2 radcich a 3 sloupcich
r = 2;
s = 3;
O = zeros(r, s);            % poradi je vzdy 'radky', pak 'sloupce'
J = ones(r, s);
I = eye(r, s);
G = randn(r, s);            % nahodna cisla - Gaussovo rozdeleni
R = rand(r, s);             % nahodna cisla - rovnomerne rozdeleni

% indexace ve vektorech / maticich
a(1)                        
a([1, 3, 2])                % vice prvku na vice pozicich
c(1, 2)
d(1, :)                     % chci pracovat s celym prvnim radkem v matici 'd'
                            % => dvojtecka znazornuje, ze chci vsechny
                            % sloupce v tom radku
d(2, 1:3)                   % druhy radek, prvni az treti sloupec 
d(:, 2) = []                % vymaze (vlozi prazdne pole) druhy sloupec matice 'd'
c(:, 1:3)                   % prvni tri sloupce z matice 'c'
c(:, 2:end)                 % od druheho sloupce do konce
f = [O, J]                  % matice vedle sebe
g = [O; J]                  % matice pod sebou
size(g)                     % rozmery matice 'g'
length(a)                   % delka vektoru 'a'

% operator ':'
1:10
1:2:11

% !!! INDEXACE V MATLABU ZACINA JEDNICKOU


%% zakladni operace
2 + 3
5 - 10
3 * 2
5 / 2
3 ^ 2
25 ^ (1 / 2)

% maticove operace
[1 2 3;4 5 6]*[1 2;3 4;5 6] % maticove nasobeni
[1 2 3 4].*[4 5 6 7]        % nasobeni prvek po prvku
[1 2 3 4]./[4 5 6 7]        % ... podobne deleni, mocneni atd...
k = [10, -2, 0, 6, 8, 2, 7];
k >= 4                      % porovnani => logkicky vektor pozic, na kterych jsou prvky vektoru 'k' vetsi rovno 4
k(k >= 4)                   % taky porovnani => uz vypise primo ty konkretni hodnoty vektoru 'k' na danych pozicich z prikazu 'k >= 4'

J = rand(4, 4);
inv(J)                      % inverzni matice

% transpozice
cmplx = [1+2j, 3-j, 5j; 2-4j, 2, -3+1j]
cmplx.'                     % transpozice
cmplx'                      % hermitovska transpozice - u real. matic dopadne stejne jako transpozice

% dalsi uzitecne funkce
sin(pi/2)
cos(pi/2)
tan(pi/2)
exp(2)
log(1e5)                    % !!! prirozeny logaritmus
log10(1e5)
log2(2048)
sqrt(25)
conj(2 + 5j)
abs(-5)

% jak na dalsi nezname funkce ?
% chci najit treba funkci, co mi da soucet prvku matice
lookfor sum                 % vyhleda funkce, v jejichz popisu je slovo 'sum'
help sum
suma =          sum(d)      % !!! pozor na zvolene jmeno promenne
suma_1 =        sum(d, 1)
suma_2 =        sum(d, 2)
suma_sumarum =  sum(sum(d))


%% ulozeni a nacteni promennych
a = 1; b = 2; c = 3; 
save myfile a b c           % ulozi vsechny 3 prom. do souboru 'myfile'
clear all
load myfile


%% prace s casem, grafy, vizualizace
% cas v matlabu neni hezky spojity, ale v diskretnich bodech
t = linspace(0, 2, 100);    % vektor casu => od nuly do dvou sekundy a 
                            % casova osa bude rozdrobena do 100 diskretnichc chlivecku
y = sin(t);                 % funkce (zde pojmenovana 'y', ktera bude odpovidat 
                            % sinu z nasi nadefinovane casove osy
z = sin(2*pi*5*t);          % sinus o frekvenci 5 Hz                            

% zakladni vizualizace                            
figure(1)                   % otevre obrazek cislo 1 - cislovani je vhodne pro orientaci mezi grafy
plot(y);                    % moc toho nevidim => muzu si nadefinovat delsi casovou osu a script spustit znovu
figure(2)   
plot(z);                    % lepsi, ale nevidim cas
figure(3);
plot(t, z)                  % fajn, ale prilis hrube rozliseni

% !!! S CASOVOU OSOU SE V PRAXI PRACUJE JINAK - 2. CVIKO

% pokrocilejsi vizualizace - az se vam to bude hodit ;)
figure(4); 
plot(t, y);
hold on;                    % umozni kreslit vic grafu pres sebe bez vymazani predchoziho
plot(t, z);
hold off;                   % kdybych to nevypnul, prekresloval bych i dalsi chtene ploty
xlabel('Cas [s]');          % vseljake popisky, mrizka atd.
ylabel('Sinus [-]');
legend('Sinus', 'Sinus 5 Hfiz');
title('Mùj graf');
grid on;

figure(5);
subplot(3, 1, 1);           % rozdeli figure na dva grafy pod sebe
plot(t, y, 'r');            % kreslim cervene
subplot(3, 1, 2);
plot(t, z, 'LineWidth', 3); % kreslim carou tloustky tri
subplot(3, 1, 3);
plot(t, z, 'b.');           % kreslim diskretni hodnoty. 'b' jako modra a '.' jakoze se ty body zobrazi jako tecka

% ... je toho hrozne moc, kdyztak mrknete na https://www.mathworks.com/help/matlab/ref/plot.html
% jsou i jine fce nez 'plot', treba 'stem' pro vykresleni diskretnich dat


%% zakladni cyklus a podminka
znamky = [1 2 1 3 1 4 2 3];figure(4); 
plot(t, y);
hold on;                    % umozni kreslit vic grafu pres sebe bez vymazani predchoziho
plot(t, z);
hold off;                   % kdybych to nevypnul, prekresloval bych i dalsi chtene ploty
xlabel('Cas [s]');          % vseljake popisky, mrizka atd.
ylabel('Sinus [-]');
legend('Sinus', 'Sinus 5 Hz');
title('Mùj graf');
grid on;
N = length(znamky);         % pocet znamek studentu
figure(4); 
plot(t, y);
hold on;                    % umozni kreslit vic grafu pres sebe bez vymazani predchoziho
plot(t, z);
hold off;                   % kdybych to nevypnul, prekresloval bych i dalsi chtene ploty
xlabel('Cas [s]');          % vseljake popisky, mrizka atd.
ylabel('Sinus [-]');
legend('Sinus', 'Sinus 5 Hz');
title('Mùj graf');
grid on;
for n = 1:N
    fprintf('znamka je %d', znamky(n));
    
    if znamky(n) <= 2
        fprintf(' -  dobry student\n');
    else
        fprintf(' -  mizerny student\n');
    end
end