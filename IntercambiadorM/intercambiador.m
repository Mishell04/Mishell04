
clearvars
close all
clc

load Intercambiador.mat
%Variables de los datos:
%time2: vector de tiempo
%out2: salida


%gráfica original del sistema

%plot(time2, out2, 'b','LineWidth',1.5)

%gráfica centrada

plot(time2-1,out2-142.46,'b')
xlabel('Tiempo [s]')
ylabel('Amplitud')
title('Datos del intercambiador');
legend({'Datos originales'});
%%
% encontrar mínimo y máximo de los datos 
min(out2) %142.4600 (se baja la gráfica al eje 0-> lo que se restó en "gráfica centrada")
max(out2) %151.1200

%resto min-max para hallar el valor de k
K= 142.46-151.12  %-8.6600

%%Hallo T, que es 0.632% de la amplitud

T_a= K*0.632; % 8.66*0.632= 5.47312 es 63.2% de 8.66
%ubico el dato anterior en la gráfica-> x =7.07=T
T=7.07 % El valor de T a ojo en la gráfica es 7.07


%Función de transferencia hallada primer orden
s=tf("s")
G=K/(1+T*s)
G1=G+8.66;
plot(time2-1,out2-142.46,'b')
hold on
step(G1,'r')
xlabel('Tiempo');
ylabel('Amplitud');
title('Datos vs Función de Transferencia');
legend({'Datos originales', 'Función de transferencia'});


figure(2)
step(G1,'r')
xlabel('Tiempo');
ylabel('Amplitud');
title('Función de Transferencia');
legend({'Función de transferencia'});

