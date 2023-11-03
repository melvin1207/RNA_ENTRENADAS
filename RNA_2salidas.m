%RED QUE CUENTA CON 2 SALIDAS Y 2 ENTRADAS
clear all
clc

% Parametros de la RNA MC
w1 = [0.0, 0.0, 0.0, 0.0];
w2 = [0.0, 0.0, 0.0, 0.0];
w36 = 0.0;
w46 = 0.0;
w56 = 0.0;
w86 = 0.0;
w37 = 0.0;
w47 = 0.0;
w57 = 0.0;
w87 = 0.0;
% bias de c/neurona
wb1 = [0.0, 0.0, 0.0, 0.0];
wb2 = [0.0, 0.0];
% constante para activación de la sigmoide
c3 = 1.0;
c4 = 1.0;
c5 = 1.0;
c6 = 1.0;
c7 = 1.0;
c8 = 1.0;

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iniciamos de forma aleatoria los pesos de la RNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : 4
    w1(i) = randi([-100, 100]) / 10;
    w2(i) = randi([-100, 100]) / 10;
    wb1(i) = randi([-100, 100] ) / 10;
end

  w36 = randi([-100, 100]) / 10;
  w46 = randi([-100, 100]) / 10;
  w56 = randi([-100, 100]) / 10;
  w86 = randi([-100, 100]) / 10;
  w37 = randi([-100, 100]) / 10;
  w47 = randi([-100, 100]) / 10;
  w57 = randi([-100, 100]) / 10;
  w87 = randi([-100, 100]) / 10;
  wb2(1) = randi([-100, 100]) / 10;
  wb2(2) = randi([-100, 100]) / 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Codigo ejemplo 004, iniciando!");

cnt = 0;      % Variables para conteo de ciclos
err = 0;      % Variables para error en el entrenamiento
cota = 0.1; % Variables para cota de error
% Deltas de cada neurona
d8 = 0;
d7 = 0;
d6 = 0;
d5 = 0;
d4 = 0;
d3 = 0;
n = 0.50;     %Factor de entrenamiento

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
err = (0.5 * sum((p - y6).^ 2)) + ( 0.5 * sum((p2 - y7).^ 2)); %Error cuadratico

%Desplegar tabla de verdad con datos de la eval de la RNA y coeficientes
disp("|| X1 | X2 || Yd || Yd2 ||  Yo  || Y1 ||");
for i = 1 : 4
    msg = "||" + compose("%.2f", x1(i)) +"|" + compose("%.2f", x2(i))+"||"+compose("%.2f",p(i))+"||"+compose("%.2f",p2(i))+"||"+compose("%.4f",y6(i))+"||"+compose("%.4f",y7(i))+"||";
    disp(msg);
end
disp("Los valores de los pesos y bias");
disp("    N3      N4      N5     N8     N6       N7");
disp("w1|" + compose("%.4f",w1(1)) + "," + compose("%.4f",w1(2)) + "," + compose("%.4f",w1(3)) + "," + compose("%.4f",w1(4)) + "|   w36|" + compose("%.4f",w36) + "|   w37|" + compose("%.4f",w37));
disp("w2|" + compose("%.4f",w2(1)) + "," + compose("%.4f",w2(2)) + "," + compose("%.4f",w2(3)) + "," + compose("%.4f",w2(4)) + "|   w46|" + compose("%.4f",w46)+ "|   w47|" + compose("%.4f",w47));
disp("B1|" + compose("%.4f",wb1(1))+ "," + compose("%.4f",wb1(2))+ "," + compose("%.4f",wb1(3)) + "," + compose("%.4f",wb1(4)) +"|   w56|" +compose("%.4f",w56)+ "|   w57|" + compose("%.4f",w57));
disp("B2|" + compose("%.4f",wb2(1)) + "," + compose("%.4f",wb2(2)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iniciamos entrenamiento de los pesos de la RNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mientra no se cumpla la meta de error, el entrenamiento sigue
while (err >= cota)
    err_a = err;  %respaldamos valor del error para calcular su variacion
    for i = 1 : 4
        % Obtenemos delta de la neurona de salida
        d6 = y6(i) * (1 - y6(i)) * (p(i) - y6(i));
        d7 = y7(i) * (1 - y7(i)) * (p2(i) - y7(i));
        % Actualiza los pesos que llegan a la neurona 6
        w36 = w36 + n * d6 * y3(i);      
        w46 = w46 + n * d6 * y4(i);
        w56 = w56 + n * d6 * y5(i);  
        w86 = w86 + n * d6 * y8(i); 

        wb2(1) = wb2(1) + n * d6;

        w37 = w37 + n * d7 * y3(i);      
        w47 = w47 + n * d7 * y4(i);
        w57 = w57 + n * d7 * y5(i); 
        w87 = w87 + n * d7 * y8(i); 

        wb2(2) = wb2(2) + n * d7;
        % Obtenemos las delta de las neuronas de la capa intermedia
        d8 = (y8(i) * (1 - y8(i)) * d6 * w86 )+ (y8(i) * (1 - y8(i)) * d7 * w87); 
        d5 = (y5(i) * (1 - y5(i)) * d6 * w56 )+ (y5(i) * (1 - y5(i)) * d7 * w57);    
        d4 = (y4(i) * (1 - y4(i)) * d6 * w46 )+ (y4(i) * (1 - y4(i)) * d7 * w47);   
        d3 = (y3(i) * (1 - y3(i)) * d6 * w36 )+ (y3(i) * (1 - y3(i)) * d7 * w37);
        % Actualiza los pesos de conexión de cada neurona intermedia 3,4,5
        w1(1) = w1(1) + n * d3 * y3(i);
        w1(2) = w1(2) + n * d4 * y4(i);
        w1(3) = w1(3) + n * d5 * y5(i);
        w1(4) = w1(4) + n * d8 * y8(i);
        w2(1) = w2(1) + n * d3 * y3(i);
        w2(2) = w2(2) + n * d4 * y4(i);
        w2(3) = w2(3) + n * d5 * y5(i);
        w2(4) = w2(4) + n * d8 * y8(i);
        wb1(1) = wb1(1) + n * d3;
        wb1(2) = wb1(2) + n * d4;
        wb1(3) = wb1(3) + n * d5;
        wb1(4) = wb1(4) + n * d8;

        % Evaluamos la red con los ajustes en los pesos
        y3(i) = perceptron(x1(i), w1(1), x2(i), w2(1), 1, wb1(1), c3);
        y4(i) = perceptron(x1(i), w1(2), x2(i), w2(2), 1, wb1(2), c4);
        y5(i) = perceptron(x1(i), w1(3), x2(i), w2(3), 1, wb1(3), c5);
        y8(i) = perceptron(x1(i), w1(4), x2(i), w2(4), 1, wb1(4), c8);
        y6(i) = perceptron4(y3(i), w36, y4(i), w46, y5(i), w56, y8(i), w86, 1, wb2(1), c6);
        y7(i) = perceptron4(y3(i), w37, y4(i), w47, y5(i), w57, y8(i), w87, 1, wb2(2), c7);
    end
    % una vez hecho los ajustes a los pesos (fase back)
    % se actualiza el valor del error cuadratico medio
    % si el error es menor a la cota se terminara el entrenamiento
    err = (0.5*sum((p-y6).^2)) + (0.5*sum((p2-y7).^2));
    delta_e = (err - err_a);    %el diferencial del error
    cnt = cnt + 1;  %registro de ciclos
    % Cada 1000 ciclos se imprime un mensaje de aviso que se esta
    % procesando y dependiendo del diferencial del error se ajusta el
    % factor de aprendizaje
    if (mod(cnt, 1000) == 0)    
        disp("1k ciclos " + compose("%.3f", err) + " & " + compose("%.3f", err_a) + " |n= " + compose("%.2f", n));
        if (delta_e < 0.0)
           n = n * 1.1;
        elseif (delta_e > 0.0)
            n = n * 0.9;    
        end
    end
end


disp(" ");
disp(" Con valores entrenados");
disp("|| X1 | X2 || Yd || Yd2 ||  Yo  || Y1 ||");

for i = 1 : 4
    msg = "||" + compose("%.2f", x1(i)) + "|" + compose("%.2f", x2(i)) + "||" + compose("%.2f", p(i)) + "||" + compose("%.2f", p2(i)) + "||" + compose("%.4f", y6(i)) + "||" + compose("%.4f", y7(i)) + "||";
    disp(msg);
end

disp("Entrenamiento en " + string(cnt) + " ciclos, valor final de n = " + string(n));