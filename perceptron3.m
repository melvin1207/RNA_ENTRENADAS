function [y] = perceptron3(x1, w1, x2, w2, x3, w3, bias, wb, c)
% Perceptron de 3 entradas + bias como entrada y 1 salida (parametro de regreso) y activacion
  temp = 0.0;
  temp = w1 * x1 + w2 * x2 + w3 * x3 + wb * bias;    % Calculo de la funcion de entrada
  temp = 1 / (1 + exp(- c * temp)); %calculo de la sigmoide
  y = temp;
end
