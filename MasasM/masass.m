
clearvars
close all
clc

load masas.mat
%Variables de los datos:
%x: tiempo
%y: amplitud


%grafico la señal filtrada sin ruido y la original:

%plot((x),(y),'Color',[1 0.5 0]) % señal sin ser filtrada

plot(smooth(x),smooth(y))% señal filtrada 
xlabel('Tiempo [s]')
ylabel('Amplitud')
title('Señal filtrada (datos experimentales)')

%tomo valor final de la gráfica(amplitud final) 
%final = y(end) %última muestra de la señal-> como la señal muestra
%  mucho ruido no se puede tomar.

%Entonces tomando 3 puntos de la señal filtrada en t=18, t=19, t=20
%y=0.126, y=0.132, y=0.122, se hace un promedio para el y_final

final= 0.1267 %también es la ganancia del sistema
mayor = max(y)

%se calcula el overshoot porcentual de la señal

%OV = abs((final - mayor)/final * 100) %tiene mucho ruido
OS=overshoot(y)

%se calcula el factor de amortiguamiento
zeta = -log(OS/100)/(sqrt(pi^2 + log(OS/100)^2))

%Obtengo el Ts desde la gráfica (tiempo de asentamiento)

%la gráfica se empieza a estabilizar desde los 13s
Ts= 13
Wn = pi/((zeta)*(Ts))


%función transferencia aproximada a segundo orden
num = [final*Wn^2];
den = [1 2*zeta*Wn Wn^2];
H = tf(num,den)

figure
step(H,'r',x(end))
xlabel('Tiempo [s]')
ylabel('Amplitud')
title('Función de transferencia')

%%
figure
plot(smooth(x),smooth(y))% señal filtrada 
hold on
step(H,'r',x(end))  % respuesta del modelo
xlabel('Tiempo [s]')
ylabel('Amplitud')
title('Señal filtrada vs Función de transferencia')
legend({'Señal filtrada','Función de Transferencia'})