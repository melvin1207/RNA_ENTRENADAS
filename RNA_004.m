% Codigo ejemplo 004 para curso de aplicacones de control por IA
% Objetivo del codigo:
%   Implementar una RNA de 3 capas de 4 entradas y 1 salida que aprende
% Particular
%   Modelo de perceptron 2E con bias como parametro de entrada
%   Modelo de perceptron 3E con bias como parametro de entrada
%   Entrenamiento de BP

% Red neuronal de 6 elementos, en 3 capas
% Capa de entrada 3 neuronas
% Capa intermedia - oculta 3 neuronas
% Capa de salida 1 neurona
%
%x1 --->(N1)--->(N3)
%          o\ /  |   \
%           o\   |    \
%           /o\  |     \
%X2 --->(N2)--->(N4)--->(N6)---> y
%           \ o  |     / |
%            \ o |    /  |
%             \ o|   /   |
%               (N5)     |
%                |       |
%B1 =============|       |
%                        |
%B2 ======================

% Lista de parametros de la red
% Capa intermedia
%    N3    N4    N5          N6
% x1 w13   w14   w15     y3  w36
% x2 w23   w24   w25     y4  w46
% B1 wb13  wb14  wb15    y5  w56
%                        B2  wb26
clc
clear

% Parametros de la RNA MC
w1 = [0.0, 0.0, 0.0];
w2 = [0.0, 0.0, 0.0];
w36 = 0.0;
w46 = 0.0;
w56 = 0.0;
% bias de c/neurona
wb1 = [0.0, 0.0, 0.0];
wb26 = 0.0;
% constante para activación de la sigmoide
c3 = 1.0;
c4 = 1.0;
c5 = 1.0;
c6 = 1.0;

% para desarrollar los calculos se tienen que generar
% variables intermedias asi como las generales de E/S
x1 = [0.0, 0.0, 1.0, 1.0];
x2 = [0.0, 1.0, 0.0, 1.0];
y3 = zeros(1, 4);
y4 = zeros(1, 4);
y5 = zeros(1, 4);
y6 = zeros(1, 4);
p = [0.0, 1.0, 0.0, 1.0];  %Resultado deseado

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iniciamos de forma aleatoria los pesos de la RNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : 3
    w1(i) = randi([-100, 100]) / 10;
    w2(i) = randi([-100, 100]) / 10;
    wb1(i) = randi([-100, 100] ) / 10;
end

  w36 = randi([-100, 100]) / 10;
  w46 = randi([-100, 100]) / 10;
  w56 = randi([-100, 100]) / 10;
  wb26 = randi([-100, 100]) / 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Codigo ejemplo 004, iniciando!");

cnt = 0;      % Variables para conteo de ciclos
err = 0;      % Variables para error en el entrenamiento
cota = 0.1; % Variables para cota de error
% Deltas de cada neurona
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
    %se procesa la capa de salida
    y6(i) = perceptron3(y3(i), w36, y4(i), w46, y5(i), w56, 1, wb26, c6);
end
err = 0.5 * sum((p - y6).^ 2); %Error cuadratico

%Desplegar tabla de verdad con datos de la eval de la RNA y coeficientes
disp("|| X1 | X2 || Yd ||  Yo  ||");
for i = 1 : 4
    msg = "||" + compose("%.2f", x1(i)) +"|" + compose("%.2f", x2(i))+"||"+compose("%.2f",p(i))+"||"+compose("%.4f",y6(i))+"||";
    disp(msg);
end
disp("Los valores de los pesos y bias");
disp("    N3      N4      N5          N6");
disp("w1|" + compose("%.4f",w1(1)) + "," + compose("%.4f",w1(2)) + "," + compose("%.4f",w1(3)) + "|   w36|" + compose("%.4f",w36));
disp("w2|" + compose("%.4f",w2(1)) + "," + compose("%.4f",w2(2)) + "," + compose("%.4f",w2(3)) + "|   w46|" + compose("%.4f",w46));
disp("B1|" + compose("%.4f",wb1(1))+ "," + compose("%.4f",wb1(2))+"," + compose("%.4f",wb1(3))+"|   w56|" +compose("%.4f",w56));
disp("                            B2|" + compose("%.4f",wb26));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iniciamos entrenamiento de los pesos de la RNA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mientra no se cumpla la meta de error, el entrenamiento sigue
while (err >= cota)
    err_a = err;  %respaldamos valor del error para calcular su variacion
    for i = 1 : 4
        % Obtenemos delta de la neurona de salida
        d6 = y6(i) * (1 - y6(i)) * (p(i) - y6(i));

        % Actualiza los pesos que llegan a la neurona 6
        w36 = w36 + n * d6 * y3(i);      
        w46 = w46 + n * d6 * y4(i);
        w56 = w56 + n * d6 * y5(i);      
        wb26 = wb26 + n * d6;

        % Obtenemos las delta de las neuronas de la capa intermedia
        d5 = y5(i) * (1 - y5(i)) * d6 * w56;      
        d4 = y4(i) * (1 - y4(i)) * d6 * w46;      
        d3 = y3(i) * (1 - y3(i)) * d6 * w36;

        % Actualiza los pesos de conexión de cada neurona intermedia 3,4,5
        w1(1) = w1(1) + n * d3 * y3(i);
        w1(2) = w1(2) + n * d4 * y4(i);
        w1(3) = w1(3) + n * d5 * y5(i);

        w2(1) = w2(1) + n * d3 * y3(i);
        w2(2) = w2(2) + n * d4 * y4(i);
        w2(3) = w2(3) + n * d5 * y5(i);
        
        wb1(1) = wb1(1) + n * d3;
        wb1(2) = wb1(2) + n * d4;
        wb1(3) = wb1(3) + n * d5;
        % Evaluamos la red con los ajustes en los pesos
        y3(i)=perceptron(x1(i),w1(1),x2(i),w2(1),1,wb1(1),c3);
        y4(i)=perceptron(x1(i),w1(2),x2(i),w2(2),1,wb1(2),c4);
        y5(i)=perceptron(x1(i),w1(3),x2(i),w2(3),1,wb1(3),c5);
        y6(i)=perceptron3(y3(i),w36,y4(i),w46,y5(i),w56,1,wb26,c6);
    end
    % una vez hecho los ajustes a los pesos (fase back)
    % se actualiza el valor del error cuadratico medio
    % si el error es menor a la cota se terminara el entrenamiento
    err=0.5*sum((p-y6).^2);
    delta_e=(err-err_a);    %el diferencial del error
    cnt=cnt+1;  %registro de ciclos
    % Cada 1000 ciclos se imprime un mensaje de aviso que se esta
    % procesando y dependiendo del diferencial del error se ajusta el
    % factor de aprendizaje
    if (mod(cnt,1000)==0)    
        disp("1k ciclos "+ compose("%.3f",err)+" & "+compose("%.3f",err_a)+" |n= "+compose("%.2f",n));
        if ((delta_e<0.0))
           n=n*1.1;
        elseif ((delta_e>0.0))
            n=n*0.9;    
        end
    end
end


disp(" ");
disp(" Con valores entrenados");
disp("|| X1 | X2 || Yd ||  Yo  ||");

for i=1:4
    msg="||"+compose("%.2f",x1(i))+"|"+compose("%.2f",x2(i))+"||"+compose("%.2f",p(i))+"||"+compose("%.4f",y6(i))+"||";
    disp(msg);
end

disp("Entrenamiento en "+string(cnt)+" ciclos, valor final de n = "+string(n));


