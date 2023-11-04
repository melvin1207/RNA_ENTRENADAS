%RED QUE CUENTA CON 2 SALIDAS Y 2 ENTRADAS ENTRENADA
clear all
clc

% Parametros de la RNA MC
w1 = [4.34047914641305, 5.50941939869252, 4.36503516211446, -9.39999949803898];
w2 = [6.04047914641309, 5.20941939869252, -5.33496483788553, -4.49999949803885];
w36 = -10.1141204141987;
w46 = 8.69471015213771;
w56 = 1.83263263363366;
w86 = -3.70026831258366;
w37 = 5.83895988516495;
w47 = -11.2001271461411;
w57 = -5.64726409863339;
w87 = -2.40145655474988;
% bias de c/neurona
wb1 = [0.451953237983484, -8.95328518744911, 5.31813868383492, -9.09551091268190];
wb2 = [2.86315736872060, 1.19092038549260];
% constante para activación de la sigmoide
c3 = 1.0;
c4 = 10.0;
c5 = 10.0;
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
p = [0.0, 0.0, 0.0, 1.0];  %Resultado deseado
p2 = [0.0, 1.0, 1.0, 0.0];

disp("RNA 4 ENTRENADO");

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