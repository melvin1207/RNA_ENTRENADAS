%RED QUE CUENTA CON 2 SALIDAS Y 2 ENTRADAS ENTRENADA
clear all
clc

% Parametros de la RNA MC
w1 = [2.24565434350846, 3.90600230543423, 11.3401105110468, -4.30091144591682];
w2 = [7.04565434350798, -3.99399769456579, -5.95988948895338, 11.9990885540812];
w36 = -0.202347763872279;
w46 = 2.43304583175099;
w56 = -8.86786508011454;
w86 = 1.38220465163357;
w37 = -6.87095269194003;
w47 = -9.43478333643607;
w57 = 6.62367554775609;
w87 = -4.81570211231171;
% bias de c/neurona
wb1 = [5.94525161969045, -2.13597261706832, 3.78944947969342, 8.60523731474025];
wb2 = [6.19079618784592, 8.75230393558265];
% constante para activación de la sigmoide
c3 = 10.0;
c4 = 10.0;
c5 = 10.0;
c6 = 20.0;
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
p = [0.0, 1.0, 1.0, 0.0];  %Resultado deseado
p2 = [1.0, 0.0, 0.0, 1.0];

disp("RNA 5 FUNCIONANDO");

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