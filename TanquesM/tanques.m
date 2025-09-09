
clearvars
close all
clc

load Tanques.mat
%Variables de los datos:
%x: tiempo
%out: amplitud

%grafico la señal 


plot(time-1,out-1.96)
xlabel('Tiempo [s]')
ylabel('Amplitud')
title('Señal con datos originales')
datacursormode on
%%
% encontrar mínimo y máximo de los datos 
max(out) %2.90
min(out) %1.96


y0=0 %inicio de la gráfica
y1=0.9 %la gráfica se va estabilizando en 0.9

%resto min-max para hallar el valor de k
K= y1-y0 %ganancia del sistema=0.9

%Nivel del 63.2%:

T_a= y0+0.632*K % 0.5688
%Ubicando el valor de T_a en la gráfica:

T=11.6

%Función de transferencia hallada primer orden
s=tf("s")
G=K/(1+T*s)
plot(time-1,out-1.96000)
hold on
step(G,'r')
xlabel('Tiempo');
ylabel('Amplitud');
title('Datos vs Función de Transferencia');
legend({'Datos originales', 'Función de transferencia'});

figure
step(G,'r')
xlabel('Tiempo [s]')
ylabel('Amplitud')
title('Función de transferencia')




 