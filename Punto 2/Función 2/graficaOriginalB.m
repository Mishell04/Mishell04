num=[1 2]

den=[5 6 13 8 7]

H=tf(num, den)

%se aproxima a segundo orden

figure
step(H, "b") %respuesta de cuarto orden
title('Función original')

%se reudce a segundo orden porque mantiene el amortiguamiento
%  y el pico de la señal


% Polos dominantes del sistema original
Wn = 1; % frecuencia natural
zeta = 0.5; % factor de amortiguamiento

K = 0.2857; % ganancia en estado estacionario

num = [K*Wn^2]; % numerador de 2do orden
den = [1 2*zeta*Wn Wn^2]; % denominador de 2do orden

H2 = tf(num, den);

figure
step(H2,'r') % respuesta al escalón del sistema aproximado
title('Aproximación a segundo orden')

%%
figure
step(H, "b") %respuesta de cuarto orden
hold on
step(H2,'r') % respuesta del sistema aproximado
title('Aproximación a segundo orden vs original')
legend('Original', 'Aproximada')   