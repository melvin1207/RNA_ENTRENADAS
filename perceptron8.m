function [y] = perceptron8(x1, w1, x2, w2, x3, w3, x4, w4, x5, w5, x6, w6, x7, w7, x8, w8, x9, w9, x10, w10, x11, w11, x12, w12, bias, wb, c)
% Perceptron de 2 entradas + bias como entrada + activacion y 1 salida
  temp = 0.0;
  temp = w1 * x1 + w2 * x2 + w3 * x3 + w4 * x4 + w5 * x5 + w6 * x6 + w7 * x7 + w8 * x8 + w9 * x9 + w10 * x10 + w11 * x11 + w12 * x12 + wb * bias;    %Calculo de la funcion de entrada
  temp = 1 / (1 + exp(- c * temp));  % calculo la funcion de activacion sigmoide
  y = temp;
end