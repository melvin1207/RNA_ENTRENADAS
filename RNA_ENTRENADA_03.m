%RED QUE CUENTA CON 2 SALIDAS Y 2 ENTRADAS ENTRENADA
clear all
clc

% Parametros de la RNA MC
w1 = [-0.209358567704105, -10.0458778797930, -9.03711372009231, 5.39259655594852];
w2 = [-8.50935856770403, -9.44587787979296, 5.46288627990765, -6.10740344405148];
w36 = -4.88809347859818;
w46 = 9.10966693143397;
w56 = 7.02978926760116;
w86 = 2.80702070158623;
w37 = 3.13491088774102;
w47 = 0.625001470186910;
w57 = 10.5053959451513;
w87 = -6.66175820902521;
% bias de c/neurona
wb1 = [4.00567122977077, -2.57569634091057, 4.26183934250617, 5.15866084597929];
wb2 = [-6.12648057138882, -3.07696427455195];
% constante para activación de la sigmoide
c3 = 10.0;
c4 = 10.0;
c5 = 1.0;
c6 = 10.0;
c7 = 10.0;
c8 = 10.0;

% para desarrollar los calculos se tienen que generar
% variables intermedias asi como las generales de E/S
x1 = [0.0, 0.0, 1.0, 1.0];
x2 = [0.0, 1.0, 0.0, 1.0];
y3 = zeros(1, 4);
y4 = zeros(1, 4);
y5 = zeros(1, 4);
y6 = zeros(1, 4);
y7 = zeros(1, 4);
y8 = zeros(1, 4);
p = [0.0, 1.0, 0.0, 1.0];  %Resultado deseado
p2 = [1.0, 1.0, 0.0, 0.0];

disp("RNA 3 ENTRENADA");

% Generamos un ciclo para evaluar los 4 casos de las entradas x1 y x2
disp("1ra fase, calculos iniciales");

for i = 1 : 4
    %se procesa la capa intermedia
    y3(i) = perceptron(x1(i), w1(1), x2(i), w2(1), 1, wb1(1), c3);
    y4(i) = perceptron(x1(i), w1(2), x2(i), w2(2), 1, wb1(2), c4);
    y5(i) = perceptron(x1(i), w1(3), x2(i), w2(3), 1, wb1(3), c5);
    y8(i) = perceptron(x1(i), w1(4), x2(i), w2(4), 1, wb1(4), c8);
    %se procesa la capa de salida
    y6(i) = perceptron4(y3(i), w36, y4(i), w46, y5(i), w56, y8(i), w86, 1, wb2(1), c6);
    y7(i) = perceptron4(y3(i), w37, y4(i), w47, y5(i), w57, y8(i), w87, 1, wb2(2), c7);
end

%Desplegar tabla de verdad con datos de la eval de la RNA y coeficientes
disp("|| X1 | X2 || Yd || Yd2 ||  Yo  || Y1 ||");
for i = 1 : 4
    msg = "||" + compose("%.2f", x1(i)) +"|" + compose("%.2f", x2(i))+"||"+compose("%.2f",p(i))+"||"+compose("%.2f",p2(i))+"||"+compose("%.4f",y6(i))+"||"+compose("%.4f",y7(i))+"||";
    disp(msg);
end
