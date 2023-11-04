clear all
clc

% Parametros de la RNA MC
w1 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
w2 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
w3 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
w4 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
w5 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
w6 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
w7 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

w8 = [0.0, 0.0, 0.0, 0.0];
w9 = [0.0, 0.0, 0.0, 0.0];
w10 = [0.0, 0.0, 0.0, 0.0];
w11 = [0.0, 0.0, 0.0, 0.0];
w12 = [0.0, 0.0, 0.0, 0.0];
w13 = [0.0, 0.0, 0.0, 0.0];
w14 = [0.0, 0.0, 0.0, 0.0];
w15 = [0.0, 0.0, 0.0, 0.0];
w20 = [0.0, 0.0, 0.0, 0.0];
w21 = [0.0, 0.0, 0.0, 0.0];
w22 = [0.0, 0.0, 0.0, 0.0];
w23 = [0.0, 0.0, 0.0, 0.0];

% bias de c/neurona
wb1 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
wb2 = [0.0, 0.0, 0.0, 0.0];

% constante para activación de la sigmoide
c8 = 1.0;
c9 = 1.0;
c10 = 1.0;
c11 = 1.0;
c12 = 1.0;
c13 = 1.0;
c14 = 1.0;
c15 = 1.0;
c16 = 1.0;
c17 = 1.0;
c18 = 1.0;
c19 = 1.0;
c20 = 1.0;
c21 = 1.0;
c22 = 1.0;
c23 = 1.0;

% para desarrollar los calculos se tienen que generar
% variables intermedias asi como las generales de E/S

x1 = [1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0];
x2 = [1.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0];
x3 = [1.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0];
x4 = [0.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0];
x5 = [0.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0];
x6 = [0.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0];
x7 = [0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 1.0];

y8 = zeros(1, 7);
y9 = zeros(1, 7);
y10 = zeros(1, 7);
y11 = zeros(1, 7);
y12 = zeros(1, 7);
y13 = zeros(1, 7);
y14 = zeros(1, 7);
y15 = zeros(1, 7);
y16 = zeros(1, 7);
y17 = zeros(1, 7);
y18 = zeros(1, 7);
y19 = zeros(1, 7);
y20 = zeros(1, 7);
y21 = zeros(1, 7);
y22 = zeros(1, 7);
y23 = zeros(1, 7);

%Resultados deseados

p1 = [0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0];
p2 = [1.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0];
p3 = [1.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0];
p4 = [1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iniciamos de forma aleatoria los pesos de la RNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : 12
    w1(i) = randi([-100, 100]) / 10;
    w2(i) = randi([-100, 100]) / 10;
    w3(i) = randi([-100, 100]) / 10;
    w4(i) = randi([-100, 100]) / 10;
    w5(i) = randi([-100, 100]) / 10;
    w6(i) = randi([-100, 100]) / 10;
    w7(i) = randi([-100, 100]) / 10;
    wb1(i) = randi([-100, 100] ) / 10;
end

for i = 1 : 4
    w8(i) = randi([-100, 100]) / 10;
    w9(i) = randi([-100, 100]) / 10;
    w10(i) = randi([-100, 100]) / 10;
    w11(i) = randi([-100, 100]) / 10;
    w12(i) = randi([-100, 100]) / 10;
    w13(i) = randi([-100, 100]) / 10;
    w14(i) = randi([-100, 100]) / 10;
    w15(i) = randi([-100, 100]) / 10;
    w20(i) = randi([-100, 100]) / 10;
    w21(i) = randi([-100, 100]) / 10;
    w22(i) = randi([-100, 100]) / 10;
    w23(i) = randi([-100, 100]) / 10;
    wb2(i) = randi([-100, 100]) / 10;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Codigo ejemplo 004, iniciando!");

cnt = 0;      % Variables para conteo de ciclos
error = 0;      % Variables para error en el entrenamiento
cota = 0.1; % Variables para cota de error

% Deltas de cada neurona
d8 = 0;
d9 = 0;
d10 = 0;
d11 = 0;
d12 = 0;
d13 = 0;
d14 = 0;
d15 = 0;
d16 = 0;
d17 = 0;
d18 = 0;
d19 = 0;
d20 = 0;
d21 = 0;
d22 = 0;
d23 = 0;
n = 0.50;     %Factor de entrenamiento

% Generamos un ciclo para evaluar los 4 casos de las entradas x1 y x2
disp("1ra fase, calculos iniciales");

for i = 1 : 7
    %se procesa la capa intermedia
    y8(i) = perceptron7(x1(i), w1(1), x2(i), w2(1), x3(i), w3(1), x4(i), w4(1), x5(i), w5(1), x6(i), w6(1), x7(i), w7(1), 1, wb1(1), c8);
    y9(i) = perceptron7(x1(i), w1(2), x2(i), w2(2), x3(i), w3(2), x4(i), w4(2), x5(i), w5(2), x6(i), w6(2), x7(i), w7(2), 1, wb1(2), c9);
    y10(i) = perceptron7(x1(i), w1(3), x2(i), w2(3), x3(i), w3(3), x4(i), w4(3), x5(i), w5(3), x6(i), w6(3), x7(i), w7(3), 1, wb1(3), c10);
    y11(i) = perceptron7(x1(i), w1(4), x2(i), w2(4), x3(i), w3(4), x4(i), w4(4), x5(i), w5(4), x6(i), w6(4), x7(i), w7(4), 1, wb1(4), c11);
    y12(i) = perceptron7(x1(i), w1(5), x2(i), w2(5), x3(i), w3(5), x4(i), w4(5), x5(i), w5(5), x6(i), w6(5), x7(i), w7(5), 1, wb1(5), c12);
    y13(i) = perceptron7(x1(i), w1(6), x2(i), w2(6), x3(i), w3(6), x4(i), w4(6), x5(i), w5(6), x6(i), w6(6), x7(i), w7(6), 1, wb1(6), c13);
    y14(i) = perceptron7(x1(i), w1(7), x2(i), w2(7), x3(i), w3(7), x4(i), w4(7), x5(i), w5(7), x6(i), w6(7), x7(i), w7(7), 1, wb1(7), c14);
    y15(i) = perceptron7(x1(i), w1(8), x2(i), w2(8), x3(i), w3(8), x4(i), w4(8), x5(i), w5(8), x6(i), w6(8), x7(i), w7(8), 1, wb1(8), c15);
    y20(i) = perceptron7(x1(i), w1(9), x2(i), w2(9), x3(i), w3(9), x4(i), w4(9), x5(i), w5(9), x6(i), w6(9), x7(i), w7(9), 1, wb1(9), c20);
    y21(i) = perceptron7(x1(i), w1(10), x2(i), w2(10), x3(i), w3(10), x4(i), w4(10), x5(i), w5(10), x6(i), w6(10), x7(i), w7(10), 1, wb1(10), c21);
    y22(i) = perceptron7(x1(i), w1(11), x2(i), w2(11), x3(i), w3(11), x4(i), w4(11), x5(i), w5(11), x6(i), w6(11), x7(i), w7(11), 1, wb1(11), c22);
    y23(i) = perceptron7(x1(i), w1(12), x2(i), w2(12), x3(i), w3(12), x4(i), w4(12), x5(i), w5(12), x6(i), w6(12), x7(i), w7(12), 1, wb1(12), c23);

    %se procesa la capa de salida
    y16(i) = perceptron8(y8(i), w8(1), y9(i), w9(1), y10(i), w10(1), y11(i), w11(1), y12(i), w12(1), y13(i), w13(1), y14(i), w14(1), y15(i), w15(1), y20(i), w20(1), y21(i), w21(1), y22(i), w22(1), y23(i), w23(1), 1, wb2(1), c16);
    y17(i) = perceptron8(y8(i), w8(2), y9(i), w9(2), y10(i), w10(2), y11(i), w11(2), y12(i), w12(2), y13(i), w13(2), y14(i), w14(2), y15(i), w15(2), y20(i), w20(2), y21(i), w21(2), y22(i), w22(2), y23(i), w23(2), 1, wb2(2), c17);
    y18(i) = perceptron8(y8(i), w8(3), y9(i), w9(3), y10(i), w10(3), y11(i), w11(3), y12(i), w12(3), y13(i), w13(3), y14(i), w14(3), y15(i), w15(3), y20(i), w20(3), y21(i), w21(3), y22(i), w22(3), y23(i), w23(3), 1, wb2(3), c18);
    y19(i) = perceptron8(y8(i), w8(4), y9(i), w9(4), y10(i), w10(4), y11(i), w11(4), y12(i), w12(4), y13(i), w13(4), y14(i), w14(4), y15(i), w15(4), y20(i), w20(4), y21(i), w21(4), y22(i), w22(4), y23(i), w23(4), 1, wb2(4), c19);
end

error = (0.5 * sum((p1 - y16).^ 2)) + ( 0.5 * sum((p2 - y17).^ 2)) + ( 0.5 * sum((p3 - y18).^ 2)) + ( 0.5 * sum((p4 - y19).^ 2)); %Error cuadratico


%Desplegar tabla de verdad con datos de la eval de la RNA y coeficientes
disp("|| X1 | X2 || X3 || X4 || X5 || X6 || X7 || Yd1 || Yd2 ||  Yd3  || Yd4 || Y1 || Y2 || Y3 || Y4");

for i = 1 : 7
    msg = "||" + compose("%.2f", x1(i)) + "||" + compose("%.2f", x2(i)) +  "||" + compose("%.2f", x3(i)) + "||" +  "||" + compose("%.2f", x4(i)) ...
        +  "||" + compose("%.2f", x5(i)) +  "||" + compose("%.2f", x6(i)) +  "||" + compose("%.2f", x7(i)) + "||" +compose("%.2f", p1(i)) ...
        + "||" + compose("%.2f", p2(i)) + "||" + compose("%.2f", p3(i)) + "||" + compose("%.2f", p4(i)) + "||"  + compose("%.4f", y16(i)) ...
        + "||" + compose("%.4f",y17(i)) + "||" + compose("%.2f", y18(i)) + "||" + compose("%.2f", y19(i)) + "||";
    disp(msg);
end

disp("Los valores de los pesos y bias");

disp("    N8      N9      N10     N11       N12     N13     N14     N15     N16     N17     N18     N19");

disp("w1|" + compose("%.4f",w1(1)) + "," + compose("%.4f",w1(2)) + "," + compose("%.4f",w1(3)) + "," + compose("%.4f",w1(4)) + "," ...
    + compose("%.4f",w1(5)) + "," + compose("%.4f",w1(6)) + "," + compose("%.4f",w1(7)) + "," + compose("%.4f",w1(8)) ...
    + "|   w8|" + compose("%.4f",w8(1)) + "," + compose("%.4f",w8(2)) + "," + compose("%.4f",w8(3)) + "," + compose("%.4f",w8(4)));
disp("w2|" + compose("%.4f",w2(1)) + "," + compose("%.4f",w2(2)) + "," + compose("%.4f",w2(3)) + "," + compose("%.4f",w2(4)) + "," ...
    + compose("%.4f",w2(5)) + "," + compose("%.4f",w2(6)) + "," + compose("%.4f",w2(7)) + "," + compose("%.4f",w2(8)) ...
    + "|   w9|" + compose("%.4f",w9(1)) + "," + compose("%.4f",w9(2)) + "," + compose("%.4f",w9(3)) + "," + compose("%.4f",w9(4)));
disp("w3|" + compose("%.4f",w3(1)) + "," + compose("%.4f",w3(2)) + "," + compose("%.4f",w3(3)) + "," + compose("%.4f",w3(4)) + "," ...
    + compose("%.4f",w3(5)) + "," + compose("%.4f",w3(6)) + "," + compose("%.4f",w3(7)) + "," + compose("%.4f",w3(8)) ...
    + "|   w10|" + compose("%.4f",w10(1)) + "," + compose("%.4f",w10(2)) + "," + compose("%.4f",w10(3)) + "," + compose("%.4f",w10(4)));
disp("w4|" + compose("%.4f",w4(1)) + "," + compose("%.4f",w4(2)) + "," + compose("%.4f",w4(3)) + "," + compose("%.4f",w4(4)) + "," ...
    + compose("%.4f",w4(5)) + "," + compose("%.4f",w4(6)) + "," + compose("%.4f",w4(7)) + "," + compose("%.4f",w4(8)) ...
    + "|   w11|" + compose("%.4f",w11(1)) + "," + compose("%.4f",w11(2)) + "," + compose("%.4f",w11(3)) + "," + compose("%.4f",w11(4)));
disp("w5|" + compose("%.4f",w5(1)) + "," + compose("%.4f",w5(2)) + "," + compose("%.4f",w5(3)) + "," + compose("%.4f",w5(4)) + "," ...
    + compose("%.4f",w5(5)) + "," + compose("%.4f",w5(6)) + "," + compose("%.4f",w5(7)) + "," + compose("%.4f",w5(8)) ...
    + "|   w12|" + compose("%.4f",w12(1)) + "," + compose("%.4f",w12(2)) + "," + compose("%.4f",w12(3)) + "," + compose("%.4f",w12(4)));
disp("w6|" + compose("%.4f",w6(1)) + "," + compose("%.4f",w6(2)) + "," + compose("%.4f",w6(3)) + "," + compose("%.4f",w6(4)) + "," ...
    + compose("%.4f",w6(5)) + "," + compose("%.4f",w6(6)) + "," + compose("%.4f",w6(7)) + "," + compose("%.4f",w6(8)) ...
    + "|   w13|" + compose("%.4f",w13(1)) + "," + compose("%.4f",w13(2)) + "," + compose("%.4f",w13(3)) + "," + compose("%.4f",w13(4)));
disp("w7|" + compose("%.4f",w7(1)) + "," + compose("%.4f",w7(2)) + "," + compose("%.4f",w7(3)) + "," + compose("%.4f",w7(4)) + "," ...
    + compose("%.4f",w7(5)) + "," + compose("%.4f",w7(6)) + "," + compose("%.4f",w7(7)) + "," + compose("%.4f",w7(8)) ...
    + "|   w14|" + compose("%.4f",w14(1)) + "," + compose("%.4f",w14(2)) + "," + compose("%.4f",w14(3)) + "," + compose("%.4f",w14(4)));
disp("|   w15|" + compose("%.4f",w15(1)) + "," + compose("%.4f",w15(2)) + "," + compose("%.4f",w15(3)) + "," + compose("%.4f",w15(4)));


disp("B1|" + compose("%.4f",wb1(1)) + "," + compose("%.4f",wb1(2)) + "," + compose("%.4f",wb1(3)) + "," + compose("%.4f",wb1(4)) + "," + compose("%.4f",wb1(5))...
    + "," + compose("%.4f",wb1(6)) + "," + compose("%.4f",wb1(7)) + "," + compose("%.4f",wb1(8)));
disp("B2|" + compose("%.4f",wb2(1)) + "," + compose("%.4f",wb2(2)) + "," + compose("%.4f",wb2(3)) + "," + compose("%.4f",wb2(4)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iniciamos entrenamiento de los pesos de la RNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mientra no se cumpla la meta de error, el entrenamiento sigue
while (error >= cota)
    err_a = error;  %respaldamos valor del error para calcular su variacion
    for i = 1 : 7
        % Obtenemos delta de la neurona de salida
        d16 = y16(i) * (1 - y16(i)) * (p1(i) - y16(i));
        d17 = y17(i) * (1 - y17(i)) * (p2(i) - y17(i));
        d18 = y18(i) * (1 - y18(i)) * (p3(i) - y18(i));
        d19 = y19(i) * (1 - y19(i)) * (p4(i) - y19(i));
     

        % Actualiza los pesos que llegan a la neurona 16
        w8(1) = w8(1) + n * d16 * y8(i);      
        w9(1) = w9(1) + n * d16 * y9(i); 
        w10(1) = w10(1) + n * d16 * y10(i); 
        w11(1) = w11(1) + n * d16 * y11(i); 
        w12(1) = w12(1) + n * d16 * y12(i); 
        w13(1) = w13(1) + n * d16 * y13(i); 
        w14(1) = w14(1) + n * d16 * y14(i); 
        w15(1) = w15(1) + n * d16 * y15(i); 
        w20(1) = w20(1) + n * d16 * y20(i); 
        w21(1) = w21(1) + n * d16 * y21(i); 
        w22(1) = w22(1) + n * d16 * y22(i); 
        w23(1) = w23(1) + n * d16 * y23(i); 
        wb2(1) = wb2(1) + n * d16;

        % Actualiza los pesos que llegan a la neurona 17
        w8(2) = w8(2) + n * d17 * y8(i);      
        w9(2) = w9(2) + n * d17 * y9(i); 
        w10(2) = w10(2) + n * d17 * y10(i); 
        w11(2) = w11(2) + n * d17 * y11(i); 
        w12(2) = w12(2) + n * d17 * y12(i); 
        w13(2) = w13(2) + n * d17 * y13(i); 
        w14(2) = w14(2) + n * d17 * y14(i); 
        w15(2) = w15(2) + n * d17 * y15(i); 
        w20(2) = w20(2) + n * d17 * y20(i); 
        w21(2) = w21(2) + n * d17 * y21(i);
        w22(2) = w22(2) + n * d17 * y22(i); 
        w23(2) = w23(2) + n * d17 * y23(i); 
        wb2(2) = wb2(2) + n * d17;

        % Actualiza los pesos que llegan a la neurona 18
        w8(3) = w8(3) + n * d18 * y8(i);      
        w9(3) = w9(3) + n * d18 * y9(i); 
        w10(3) = w10(3) + n * d18 * y10(i); 
        w11(3) = w11(3) + n * d18 * y11(i); 
        w12(3) = w12(3) + n * d18 * y12(i); 
        w13(3) = w13(3) + n * d18 * y13(i); 
        w14(3) = w14(3) + n * d18 * y14(i); 
        w15(3) = w15(3) + n * d18 * y15(i); 
        w20(3) = w20(3) + n * d18 * y20(i); 
        w21(3) = w21(3) + n * d18 * y21(i);
        w22(3) = w22(3) + n * d18 * y22(i); 
        w23(3) = w23(3) + n * d18 * y23(i); 
        wb2(3) = wb2(3) + n * d18;

        % Actualiza los pesos que llegan a la neurona 19
        w8(4) = w8(4) + n * d19 * y8(i);      
        w9(4) = w9(4) + n * d19 * y9(i); 
        w10(4) = w10(4) + n * d19 * y10(i); 
        w11(4) = w11(4) + n * d19 * y11(i); 
        w12(4) = w12(4) + n * d19 * y12(i); 
        w13(4) = w13(4) + n * d19 * y13(i); 
        w14(4) = w14(4) + n * d19 * y14(i); 
        w15(4) = w15(4) + n * d19 * y15(i); 
        w20(4) = w20(4) + n * d19 * y20(i); 
        w21(4) = w21(4) + n * d19 * y21(i);
        w22(4) = w22(4) + n * d19 * y22(i); 
        w23(4) = w23(4) + n * d19 * y23(i); 
        wb2(4) = wb2(4) + n * d19;



        % Obtenemos las delta de las neuronas de la capa intermedia
        d8 = (y8(i) * (1 - y8(i)) * d16 * w8(1)) + (y8(i) * (1 - y8(i)) * d17 * w8(2)) + (y8(i) * (1 - y8(i)) * d18 * w8(3)) + (y8(i) * (1 - y8(i)) * d19 * w8(4)); 
        d9 = (y9(i) * (1 - y9(i)) * d16 * w9(1)) + (y9(i) * (1 - y9(i)) * d17 * w9(2)) + (y9(i) * (1 - y9(i)) * d18 * w9(3)) + (y9(i) * (1 - y9(i)) * d19 * w9(4)); 
        d10 = (y10(i) * (1 - y10(i)) * d16 * w10(1)) + (y10(i) * (1 - y10(i)) * d17 * w10(2)) + (y10(i) * (1 - y10(i)) * d18 * w10(3)) + (y10(i) * (1 - y10(i)) * d19 * w10(4)); 
        d11 = (y11(i) * (1 - y11(i)) * d16 * w11(1)) + (y11(i) * (1 - y11(i)) * d17 * w11(2)) + (y11(i) * (1 - y11(i)) * d18 * w11(3)) + (y11(i) * (1 - y11(i)) * d19 * w11(4)); 
        d12 = (y12(i) * (1 - y12(i)) * d16 * w12(1)) + (y12(i) * (1 - y12(i)) * d17 * w12(2)) + (y12(i) * (1 - y12(i)) * d18 * w12(3)) + (y12(i) * (1 - y12(i)) * d19 * w12(4)); 
        d13 = (y13(i) * (1 - y13(i)) * d16 * w13(1)) + (y13(i) * (1 - y13(i)) * d17 * w13(2)) + (y13(i) * (1 - y13(i)) * d18 * w13(3)) + (y13(i) * (1 - y13(i)) * d19 * w13(4)); 
        d14 = (y14(i) * (1 - y14(i)) * d16 * w14(1)) + (y14(i) * (1 - y14(i)) * d17 * w14(2)) + (y14(i) * (1 - y14(i)) * d18 * w14(3)) + (y14(i) * (1 - y14(i)) * d19 * w14(4)); 
        d15 = (y15(i) * (1 - y15(i)) * d16 * w15(1)) + (y15(i) * (1 - y15(i)) * d17 * w15(2)) + (y15(i) * (1 - y15(i)) * d18 * w15(3)) + (y15(i) * (1 - y15(i)) * d19 * w15(4)); 
        d20 = (y20(i) * (1 - y20(i)) * d16 * w20(1)) + (y20(i) * (1 - y20(i)) * d17 * w20(2)) + (y20(i) * (1 - y20(i)) * d18 * w20(3)) + (y20(i) * (1 - y20(i)) * d19 * w20(4));
        d21 = (y21(i) * (1 - y21(i)) * d16 * w21(1)) + (y21(i) * (1 - y21(i)) * d17 * w21(2)) + (y21(i) * (1 - y21(i)) * d18 * w21(3)) + (y21(i) * (1 - y21(i)) * d19 * w21(4));
        d22 = (y22(i) * (1 - y22(i)) * d16 * w22(1)) + (y22(i) * (1 - y22(i)) * d17 * w22(2)) + (y22(i) * (1 - y22(i)) * d18 * w22(3)) + (y22(i) * (1 - y22(i)) * d19 * w22(4));
        d23 = (y23(i) * (1 - y23(i)) * d16 * w23(1)) + (y23(i) * (1 - y23(i)) * d17 * w23(2)) + (y23(i) * (1 - y23(i)) * d18 * w23(3)) + (y23(i) * (1 - y23(i)) * d19 * w23(4));



        % Actualiza los pesos de conexión de cada neurona intermedia 8, 9,
        % 10, 11 , 12, 13, 14, 15
        w1(1) = w1(1) + n * d8 * y8(i);
        w1(2) = w1(2) + n * d9 * y9(i);
        w1(3) = w1(3) + n * d10 * y10(i);
        w1(4) = w1(4) + n * d11 * y11(i);
        w1(5) = w1(5) + n * d12 * y12(i);
        w1(6) = w1(6) + n * d13 * y13(i);
        w1(7) = w1(7) + n * d14 * y14(i);
        w1(8) = w1(8) + n * d15 * y15(i);
        w1(9) = w1(9) + n * d20 * y20(i);
        w1(10) = w1(10) + n * d21 * y21(i);
        w1(11) = w1(11) + n * d22 * y22(i);
        w1(12) = w1(12) + n * d23 * y23(i);
        
        w2(1) = w2(1) + n * d8 * y8(i);
        w2(2) = w2(2) + n * d9 * y9(i);
        w2(3) = w2(3) + n * d10 * y10(i);
        w2(4) = w2(4) + n * d11 * y11(i);
        w2(5) = w2(5) + n * d12 * y12(i);
        w2(6) = w2(6) + n * d13 * y13(i);
        w2(7) = w2(7) + n * d14 * y14(i);
        w2(8) = w2(8) + n * d15 * y15(i);
        w2(9) = w2(9) + n * d20 * y20(i);
        w2(10) = w2(10) + n * d21 * y21(i);
        w2(11) = w2(11) + n * d22 * y22(i);
        w2(12) = w2(12) + n * d23 * y23(i);
        
        w3(1) = w3(1) + n * d8 * y8(i);
        w3(2) = w3(2) + n * d9 * y9(i);
        w3(3) = w3(3) + n * d10 * y10(i);
        w3(4) = w3(4) + n * d11 * y11(i);
        w3(5) = w3(5) + n * d12 * y12(i);
        w3(6) = w3(6) + n * d13 * y13(i);
        w3(7) = w3(7) + n * d14 * y14(i);
        w3(8) = w3(8) + n * d15 * y15(i);
        w3(9) = w3(9) + n * d20 * y20(i);
        w3(10) = w3(10) + n * d21 * y21(i);
        w3(11) = w3(11) + n * d22 * y22(i);
        w3(12) = w3(12) + n * d23 * y23(i);

        w4(1) = w4(1) + n * d8 * y8(i);
        w4(2) = w4(2) + n * d9 * y9(i);
        w4(3) = w4(3) + n * d10 * y10(i);
        w4(4) = w4(4) + n * d11 * y11(i);
        w4(5) = w4(5) + n * d12 * y12(i);
        w4(6) = w4(6) + n * d13 * y13(i);
        w4(7) = w4(7) + n * d14 * y14(i);
        w4(8) = w4(8) + n * d15 * y15(i);
        w4(9) = w4(9) + n * d20 * y20(i);
        w4(10) = w4(10) + n * d21 * y21(i);
        w4(11) = w4(11) + n * d22 * y22(i);
        w4(12) = w4(12) + n * d23 * y23(i);

        w5(1) = w5(1) + n * d8 * y8(i);
        w5(2) = w5(2) + n * d9 * y9(i);
        w5(3) = w5(3) + n * d10 * y10(i);
        w5(4) = w5(4) + n * d11 * y11(i);
        w5(5) = w5(5) + n * d12 * y12(i);
        w5(6) = w5(6) + n * d13 * y13(i);
        w5(7) = w5(7) + n * d14 * y14(i);
        w5(8) = w5(8) + n * d15 * y15(i);
        w5(9) = w5(9) + n * d20 * y20(i);
        w5(10) = w5(10) + n * d21 * y21(i);
        w5(11) = w5(11) + n * d22 * y22(i);
        w5(12) = w5(12) + n * d23 * y23(i);

        w6(1) = w6(1) + n * d8 * y8(i);
        w6(2) = w6(2) + n * d9 * y9(i);
        w6(3) = w6(3) + n * d10 * y10(i);
        w6(4) = w6(4) + n * d11 * y11(i);
        w6(5) = w6(5) + n * d12 * y12(i);
        w6(6) = w6(6) + n * d13 * y13(i);
        w6(7) = w6(7) + n * d14 * y14(i);
        w6(8) = w6(8) + n * d15 * y15(i);
        w6(9) = w6(9) + n * d20 * y20(i);
        w6(10) = w6(10) + n * d21 * y21(i);
        w6(11) = w6(11) + n * d22 * y22(i);
        w6(12) = w6(12) + n * d23 * y23(i);

        w7(1) = w7(1) + n * d8 * y8(i);
        w7(2) = w7(2) + n * d9 * y9(i);
        w7(3) = w7(3) + n * d10 * y10(i);
        w7(4) = w7(4) + n * d11 * y11(i);
        w7(5) = w7(5) + n * d12 * y12(i);
        w7(6) = w7(6) + n * d13 * y13(i);
        w7(7) = w7(7) + n * d14 * y14(i);
        w7(8) = w7(8) + n * d15 * y15(i);
        w7(9) = w7(9) + n * d20 * y20(i);
        w7(10) = w7(10) + n * d21 * y21(i); 
        w7(11) = w7(11) + n * d22 * y22(i);
        w7(12) = w7(12) + n * d23 * y23(i);


        wb1(1) = wb1(1) + n * d8;
        wb1(2) = wb1(2) + n * d9;
        wb1(3) = wb1(3) + n * d10;
        wb1(4) = wb1(4) + n * d11;
        wb1(5) = wb1(5) + n * d12;
        wb1(6) = wb1(6) + n * d13;
        wb1(7) = wb1(7) + n * d14;
        wb1(8) = wb1(8) + n * d15;
        wb1(9) = wb1(9) + n * d20;
        wb1(10) = wb1(10) + n * d21;
        wb1(11) = wb1(11) + n * d22;
        wb1(12) = wb1(12) + n * d23;

         %se procesa la capa intermedia
    y8(i) = perceptron7(x1(i), w1(1), x2(i), w2(1), x3(i), w3(1), x4(i), w4(1), x5(i), w5(1), x6(i), w6(1), x7(i), w7(1), 1, wb1(1), c8);
    y9(i) = perceptron7(x1(i), w1(2), x2(i), w2(2), x3(i), w3(2), x4(i), w4(2), x5(i), w5(2), x6(i), w6(2), x7(i), w7(2), 1, wb1(2), c9);
    y10(i) = perceptron7(x1(i), w1(3), x2(i), w2(3), x3(i), w3(3), x4(i), w4(3), x5(i), w5(3), x6(i), w6(3), x7(i), w7(3), 1, wb1(3), c10);
    y11(i) = perceptron7(x1(i), w1(4), x2(i), w2(4), x3(i), w3(4), x4(i), w4(4), x5(i), w5(4), x6(i), w6(4), x7(i), w7(4), 1, wb1(4), c11);
    y12(i) = perceptron7(x1(i), w1(5), x2(i), w2(5), x3(i), w3(5), x4(i), w4(5), x5(i), w5(5), x6(i), w6(5), x7(i), w7(5), 1, wb1(5), c12);
    y13(i) = perceptron7(x1(i), w1(6), x2(i), w2(6), x3(i), w3(6), x4(i), w4(6), x5(i), w5(6), x6(i), w6(6), x7(i), w7(6), 1, wb1(6), c13);
    y14(i) = perceptron7(x1(i), w1(7), x2(i), w2(7), x3(i), w3(7), x4(i), w4(7), x5(i), w5(7), x6(i), w6(7), x7(i), w7(7), 1, wb1(7), c14);
    y15(i) = perceptron7(x1(i), w1(8), x2(i), w2(8), x3(i), w3(8), x4(i), w4(8), x5(i), w5(8), x6(i), w6(8), x7(i), w7(8), 1, wb1(8), c15);
    y20(i) = perceptron7(x1(i), w1(9), x2(i), w2(9), x3(i), w3(9), x4(i), w4(9), x5(i), w5(9), x6(i), w6(9), x7(i), w7(9), 1, wb1(9), c20);
    y21(i) = perceptron7(x1(i), w1(10), x2(i), w2(10), x3(i), w3(10), x4(i), w4(10), x5(i), w5(10), x6(i), w6(10), x7(i), w7(10), 1, wb1(10), c21);
    y22(i) = perceptron7(x1(i), w1(11), x2(i), w2(11), x3(i), w3(11), x4(i), w4(11), x5(i), w5(11), x6(i), w6(11), x7(i), w7(11), 1, wb1(11), c22);
    y23(i) = perceptron7(x1(i), w1(12), x2(i), w2(12), x3(i), w3(12), x4(i), w4(12), x5(i), w5(12), x6(i), w6(12), x7(i), w7(12), 1, wb1(12), c23);

    y16(i) = perceptron8(y8(i), w8(1), y9(i), w9(1), y10(i), w10(1), y11(i), w11(1), y12(i), w12(1), y13(i), w13(1), y14(i), w14(1), y15(i), w15(1), y20(i), w20(1), y21(i), w21(1), y22(i), w22(1), y23(i), w23(1), 1, wb2(1), c16);
    y17(i) = perceptron8(y8(i), w8(2), y9(i), w9(2), y10(i), w10(2), y11(i), w11(2), y12(i), w12(2), y13(i), w13(2), y14(i), w14(2), y15(i), w15(2), y20(i), w20(2), y21(i), w21(2), y22(i), w22(2), y23(i), w23(2), 1, wb2(2), c17);
    y18(i) = perceptron8(y8(i), w8(3), y9(i), w9(3), y10(i), w10(3), y11(i), w11(3), y12(i), w12(3), y13(i), w13(3), y14(i), w14(3), y15(i), w15(3), y20(i), w20(3), y21(i), w21(3), y22(i), w22(3), y23(i), w23(3), 1, wb2(3), c18);
    y19(i) = perceptron8(y8(i), w8(4), y9(i), w9(4), y10(i), w10(4), y11(i), w11(4), y12(i), w12(4), y13(i), w13(4), y14(i), w14(4), y15(i), w15(4), y20(i), w20(4), y21(i), w21(4), y22(i), w22(4), y23(i), w23(4), 1, wb2(4), c19);
 end

    % una vez hecho los ajustes a los pesos (fase back)
    % se actualiza el valor del error cuadratico medio
    % si el error es menor a la cota se terminara el entrenamiento

    error = (0.5 * sum((p1 - y16).^ 2)) + ( 0.5 * sum((p2 - y17).^ 2)) + ( 0.5 * sum((p3 - y18).^ 2)) + ( 0.5 * sum((p4 - y19).^ 2));

    delta_e = (error - err_a);    %el diferencial del error

    cnt = cnt + 1;  %registro de ciclos

    % Cada 1000 ciclos se imprime un mensaje de aviso que se esta
    % procesando y dependiendo del diferencial del error se ajusta el
    % factor de aprendizaje

    if (mod(cnt, 1000) == 0)    
        disp("1k ciclos " + compose("%.3f", error) + " & " + compose("%.3f", err_a) + " |n= " + compose("%.2f", n));
        if (delta_e < 0.0)
           n = n * 1.1;
        elseif (delta_e > 0.0)
            n = n * 0.9;    
        end
    end
end


disp(" ");
disp(" Con valores entrenados");
disp("|| X1 | X2 || X3 || X4 || X5 || X6 || X7 || Yd1 || Yd2 || Yd3 || Yd4 ||  Y1  || Y2 ||  Y3 || Y4 ||");

for i = 1 : 7
    msg = "||" + compose("%.2f", x1(i)) + "|" + compose("%.2f", x2(i)) + "||" + compose("%.2f", x3(i)) + "||" + compose("%.2f", x4(i)) + "||" ...
        + compose("%.2f", x5(i)) + "||" + compose("%.2f", x6(i)) + "||" + compose("%.2f", x7(i)) + "||"  + compose("%.2f", p1(i)) + "||" ...
        + compose("%.2f", p2(i)) + "||" + compose("%.2f", p3(i)) + "||" + compose("%.2f", p4(i)) + "||" + compose("%.4f", y16(i)) + "||" ...
        + compose("%.4f", y17(i)) + "||" + compose("%.4f", y18(i)) + "||" + compose("%.4f", y19(i)) + "||";
    disp(msg);
end

disp("Entrenamiento en " + string(cnt) + " ciclos, valor final de n = " + string(n));