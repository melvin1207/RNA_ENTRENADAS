//RNA DE UNA SALIDA ENTRENADA
//ENTRADAS
float x1[4] = {0.0, 0.0, 1.0, 1.0};
float x2[4] = {0.0, 1.0, 0.0, 1.0};

//Parametros de la RNA MC
float w1[4] = {-0.209358567704105, -10.0458778797930, -9.03711372009231, 5.39259655594852};
float w2[4] = {-8.50935856770403, -9.44587787979296, 5.46288627990765, -6.10740344405148};

float w36 = -4.88809347859818;
float w46 = 9.10966693143397;
float w56 = 7.02978926760116;
float w86 = 2.80702070158623;
float w37 = 3.13491088774102;
float w47 = 0.625001470186910;
float w57 = 10.5053959451513;
float w87 = -6.66175820902521;


// bias de c/neurona
float wb1[4] = {4.00567122977077, -2.57569634091057, 4.26183934250617, 5.15866084597929};
float wb2[2] = {-6.12648057138882, -3.07696427455195};
// constante para activación de la sigmoide
float c3 = 10.0;
float c4 = 10.0;
float c5 = 1.0;
float c6 = 10.0;
float c7 = 10.0;
float c8 = 10.0;

//Resultado deseado
float p[4] = {0.0, 1.0, 0.0, 1.0}; 
float p2[4] = {1.0, 1.0, 0.0, 0.0};

float y3[4] = {0.0, 0.0, 0.0, 0.0};
float y4[4] = {0.0, 0.0, 0.0, 0.0};
float y5[4] = {0.0, 0.0, 0.0, 0.0};
float y6[4] = {0.0, 0.0, 0.0, 0.0};
float y7[4] = {0.0, 0.0, 0.0, 0.0};
float y8[4] = {0.0, 0.0, 0.0, 0.0};

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
    y8[i] = perceptron(x1[i], w1[3], x2[i], w2[3], 1, wb1[3], c8);
    //se procesa la capa de salida
    y6[i] = perceptron4(y3[i], w36, y4[i], w46, y5[i], w56, y8[i], w86, 1, wb2[0], c6);
    y7[i] = perceptron4(y3[i], w37, y4[i], w47, y5[i], w57, y8[i], w87, 1, wb2[1], c7);
  }

  Serial.println("Los resultados son: ");
  Serial.println("|| X1 | X2 || Yd1 ||  Yd2  || Y1 || Y2 ||");

  for(int i = 0; i <= 3; i++){
    mensaje = String("|| " + String(x1[i]) + " | " + String(x2[i]) + " || " + String(p[i]) + " || " + String(p2[i]) + " || " + String(y6[i]) + " || " + String(y7[i]) + " ||");
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

float perceptron4(float x1, float w1, float x2, float w2, float x3, float w3, float x4, float w4, float bias, float wb, float c){
//Perceptron de 3 entradas + bias como entrada y 1 salida (parametro de regreso) y activacion
  float temp = 0.0;
  float y = 0.0;
  temp = w1 * x1 + w2 * x2 + w3 * x3 + w4 * x4 + wb * bias;   //Calculo de la funcion de entrada
  temp = 1 / (1 + exp(- c * temp)); //calculo de la sigmoide
  return y = temp;
}
