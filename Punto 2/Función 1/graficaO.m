%% 

num=[1 20]

den=[1 7 19 45]

H=tf(num, den)

figure
step(H, "b") %gráfica original de segundo orden
title('Función original')

%se reudce a segundo orden porque mantiene el amortiguamiento
%  y el pico de la señal


% Polos dominantes del sistema original
Wn = 3; % frecuencia natural
zeta = 1/3; % factor de amortiguamiento

K = 20/45; % ganancia en estado estacionario

num = [K*Wn^2]; % numerador de 2do orden
den = [1 2*zeta*Wn Wn^2]; % denominador de 2do orden

H2 = tf(num, den);

figure
step(H2,'r') % respuesta al escalón del sistema aproximado
title('Aproximación a segundo orden')

%%
figure
step(H, "b") %gráfica original de segundo orden
hold on
step(H2,'r') % respuesta del sistema aproximado
title('Aproximación a segundo orden vs original')
legend('Original', 'Aproximada')   
 