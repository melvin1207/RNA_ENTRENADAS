clc
clear

x1 = [0.0, 0.0, 1.0, 1.0];
x2 = [0.0, 1.0, 0.0, 1.0];

% Parametros de la RNA MC
w1 = [-0.956430950127051, 1.48108500341868, 8.38860150267789];
w2 = [3.84356904987299, -6.41891499658161, -8.91139849732207];
w36 = 3.4407;
w46 = 9.0986;
w56 = -12.2898;

% bias de c/neurona
wb1 = [2.67744761188923, -9.86828793873103, 0.848509336771744];
wb26 = 6.7964;
% constante para activación de la sigmoide
c3 = 1.0;
c4 = 1.0;
c5 = 1.0;
c6 = 1.0;

p = [1.0, 1.0, 0.0, 0.0];  %Resultado deseado

disp("RNA 1 INICIADO");

% Generamos un ciclo para evaluar los 4 casos de las entradas x1 y x2
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