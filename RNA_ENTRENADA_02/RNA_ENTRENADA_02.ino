//RNA DE UNA SALIDA ENTRENADA
//ENTRADAS
float x1[4] = {0.0, 0.0, 1.0, 1.0};
float x2[4] = {0.0, 1.0, 0.0, 1.0};

//Parametros de la RNA MC
float w1[4] = {-9.00948713321596, 8.96258101645720, -0.604473215560703};
float w2[4] = {0.590512866784408, -7.13741898354284, -9.80447321554849};
float w36 = 5.2717;
float w46 = -3.5085;
float w56 = -3.8356;

// bias de c/neurona
float wb1[4] = {5.48651280363295, 2.13467594651603, -3.15399786994312};
float wb26 = 0.7283;
// constante para activación de la sigmoide
float c3 = 1.0;
float c4 = 1.0;
float c5 = 1.0;
float c6 = 1.0;

//Resultado deseado
float p[4] = {1.0, 1.0, 0.0, 0.0};

float y3[4] = {0.0, 0.0, 0.0, 0.0};
float y4[4] = {0.0, 0.0, 0.0, 0.0};
float y5[4] = {0.0, 0.0, 0.0, 0.0};
float y6[4] = {0.0, 0.0, 0.0, 0.0};

String mensaje;

void setup() {
  Serial.begin(115200);
  Serial.println("Aqui comienza la ejecución del programa");
}

void loop() {
  for(int i = 0; i <= 3; i++){
    //se procesa la capa intermedia
    y3[i] = perceptron(x1[i], w1[0], x2[i], w2[0], 1, wb1[0], c3);
    y4[i] = perceptron(x1[i], w1[1], x2[i], w2[1], 1, wb1[1], c4);
    y5[i] = perceptron(x1[i], w1[2], x2[i], w2[2], 1, wb1[2], c5);
    //se procesa la capa de salida
    y6[i] = perceptron3(y3[i], w36, y4[i], w46, y5[i], w56, 1, wb26, c6);
  }

  Serial.println("Los resultados son: ");
  Serial.println("|| X1 | X2 || Yd ||  Yo  ||");

  for(int i = 0; i <= 3; i++){
    mensaje = String("|| " + String(x1[i]) + " | " + String(x2[i]) + " || " + String(p[i]) + " || " + String(y6[i]) + " ||");
    Serial.println(mensaje);
  }
  
  
  delay(1000);
}

//AREA DE FUNCIONES
float perceptron(float x1, float w1, float x2, float w2, float bias, float wb, float c){
//Perceptron de 2 entradas + bias como entrada + activacion y 1 salida
  float temp = 0.0;
  float y = 0.0;
  temp = w1 * x1 + w2 * x2 + wb * bias;    //Calculo de la funcion de entrada
  temp = 1 / (1 + exp(- c * temp));  //calculo la funcion de activacion sigmoide
  return y = temp;
}

float perceptron3(float x1, float w1, float x2, float w2, float x3, float w3, float bias, float wb, float c){
//Perceptron de 3 entradas + bias como entrada y 1 salida (parametro de regreso) y activacion
  float temp = 0.0;
  float y = 0.0;
  temp = w1 * x1 + w2 * x2 + w3 * x3 + wb * bias;   //Calculo de la funcion de entrada
  temp = 1 / (1 + exp(- c * temp)); //calculo de la sigmoide
  return y = temp;
}