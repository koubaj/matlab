%% Mandelbrotova mnozina
% https://en.wikipedia.org/wiki/Mandelbrot_set

%% 1. Vytvořte matici 'x' s rozmerem NxN, která bude pro každý svůj řádek obsahovat vektor od -2 do 1   
% Pro začátek zvolte hodnotu N = 100 (větší rozměr má i větší rozlišení a
% hezčí výsledek, ale delší výpočet).
N = 100;
x = repmat(linspace(-2,1,N),N,1);


%% 2. Napiste matici 'y' s rozměrem NxN, která bude pro každý svůj sloupec obsahovat vektor od -2 do 1.5 
y = repmat(linspace(-2, 1.5, N), N, 1)';

 
%% 3. Určete 'z0' jako: x + 1i*y
z0 = x + 1i*y;
%% 4. Iniciujte proměnnou 'mandelbrot' jako matici jedniček o rozměru NxN
mandelbrot = ones(N, N);
%% 5. Iniciujte matici: z = z0
z = z0;
%% 6. Iterujte rovnici: z = z.*z + z0
%   V každé iteraci přičtěte k matici 'mandelbrot' hodnotu jedna pouze pro
%   ty pozice, kde je absolutní hodnota matice 'z' menší nebo rovna 2
iter = 100
for k = 0:iter
    z = z.*z + z0

    mandelbrot( find(abs(z)<=2)) = mandelbrot( find(abs(z)<=2)) + 1; 
end


%% 7. Proveďte cca 100 až 500 iterací (vyzkoušejte různé hodnoty)



%% 8. Proměnnou 'mandelbrot' zlogaritmujte a vykreslete příkazem imagesc

imagesc(log(reshape(mandelbrot,N,N)))
