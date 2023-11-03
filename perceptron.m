function [y] = perceptron(x1, w1, x2, w2, bias, wb, c)
% Perceptron de 2 entradas + bias como entrada + activacion y 1 salida
  temp = 0.0;
  temp = w1*x1+w2*x2+wb*bias;    %Calculo de la funcion de entrada
  temp=1/(1+exp(-c*temp));  % calculo la funcion de activacion sigmoide
  y=temp;
end
    