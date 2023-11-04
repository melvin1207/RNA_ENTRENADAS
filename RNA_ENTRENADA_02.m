clc
clear

x1 = [0.0, 0.0, 1.0, 1.0];
x2 = [0.0, 1.0, 0.0, 1.0];

% Parametros de la RNA MC
w1 = [-9.00948713321596, 8.96258101645720, -0.604473215560703];
w2 = [0.590512866784408, -7.13741898354284, -9.80447321554849];
w36 = 5.2717;
w46 = -3.5085;
w56 = -3.8356;

% bias de c/neurona
wb1 = [5.48651280363295, 2.13467594651603, -3.15399786994312];
wb26 = 0.7283;
% constante para activación de la sigmoide
c3 = 1.0;
c4 = 1.0;
c5 = 1.0;
c6 = 10.0;

p = [1.0, 1.0, 0.0, 0.0];  %Resultado deseado

disp("RNA 2 ENTRENADA");

% Generamos un ciclo para evaluar los 4 casos de las entradas x1 y x2
disp("1ra fase, calculos iniciales");

for i = 1 : 4
    %se procesa la capa intermedia
    y3(i) = perceptron(x1(i), w1(1), x2(i), w2(1), 1, wb1(1), c3);
    y4(i) = perceptron(x1(i), w1(2), x2(i), w2(2), 1, wb1(2), c4);
    y5(i) = perceptron(x1(i), w1(3), x2(i), w2(3), 1, wb1(3), c5);
    %se procesa la capa de salida
    y6(i) = perceptron3(y3(i), w36, y4(i), w46, y5(i), w56, 1, wb26, c6);
end

disp(" ");
disp(" Con valores entrenados");
disp("|| X1 | X2 || Yd ||  Yo  ||");

for i=1:4
    msg="||"+compose("%.2f",x1(i))+"|"+compose("%.2f",x2(i))+"||"+compose("%.2f",p(i))+"||"+compose("%.4f",y6(i))+"||";
    disp(msg);
end
