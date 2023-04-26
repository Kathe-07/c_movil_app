#include <AFMotor.h>

//pines iniciales de los motores
  AF_DCMotor motor1(4, MOTOR12_1KHZ);
  AF_DCMotor motor2(5, MOTOR12_1KHZ);
 /* AF_DCMotor motor3(3, MOTOR34_1KHZ);
  AF_DCMotor motor4(4, MOTOR34_1KHZ);*/

char comando;

void setup()k
{
Serial.begin(9600); //Configurar la velocidad de comunicación con el módulo Bluetooth.
}

void loop(){
  if(Serial.available() > 0){
    comando = Serial.read();
    detener(); //inicializar los motores detenidos
    //Cambiar el modo del pin solo si el nuevo comando es diferente del anterior.
    //Serial.println(comando);
    switch(comando){
    case 'F':
      adelante();
      break;
    case 'B':
      atras();
      break;
    case 'L':
      izquierda();
      break;
    case 'R':
      derecha();
      break;


}
  }   
    }

void adelante()
{
  motor1.setSpeed(255); //Definir la velocidad máxima
  motor1.run(FORWARD); //hacer girar el motor en sentido horario
  motor2.setSpeed(255); //Definir la velocidad máxima
  motor2.run(FORWARD); //hacer girar el motor en sentido horario
  /*motor3.setSpeed(255);//Definir la velocidad máxima
  motor3.run(FORWARD); //hacer girar el motor en sentido horario
  motor4.setSpeed(255);//Definir la velocidad máxima
  motor4.run(FORWARD); //hacer girar el motor en sentido horario*/
}
void atras()
{
  motor1.setSpeed(255); //Definir la velocidad máxima
  motor1.run(BACKWARD); //hacer girar el motor en sentido antihorario
  motor2.setSpeed(255); //Definir la velocidad máxima
  motor2.run(BACKWARD); //hacer girar el motor en sentido antihorario
  /*motor3.setSpeed(255); //Definir la velocidad máxima
  motor3.run(BACKWARD); //hacer girar el motor en sentido antihorario
  motor4.setSpeed(255); //Definir la velocidad máxima
  motor4.run(BACKWARD); //hacer girar el motor en sentido antihorario*/
}

void izquierda()
{
  motor1.setSpeed(255); //Definir la velocidad máxima
  motor1.run(BACKWARD); //hacer girar el motor en sentido antihorario
  motor2.setSpeed(255); //Definir la velocidad máxima
  motor2.run(BACKWARD); //hacer girar el motor en sentido antihorario
 /* motor3.setSpeed(255); //Definir la velocidad máxima
  motor3.run(FORWARD); //hacer girar el motor en sentido horario
  motor4.setSpeed(255); //Definir la velocidad máxima
  motor4.run(FORWARD); //hacer girar el motor en sentido horario*/
}

void derecha()
{
  motor1.setSpeed(255); //Define la velocidad máxima
  motor1.run(FORWARD); //gira el motor en el sentido de las agujas del reloj
  motor2.setSpeed(255); //Define la velocidad máxima
  motor2.run(FORWARD); //gira el motor en el sentido de las agujas del reloj
 /* motor3.setSpeed(255); //Define la velocidad máxima
  motor3.run(BACKWARD); //gira el motor en sentido contrario a las agujas del reloj
  motor4.setSpeed(255); //Define la velocidad máxima
  motor4.run(BACKWARD); //gira el motor en sentido contrario a las agujas del reloj*/
}
void detener()
{
  motor1.setSpeed(0); //Define la velocidad mínima
  motor1.run(RELEASE); //detiene el motor cuando se suelta el botón
  motor2.setSpeed(0); //Define la velocidad mínima
  motor2.run(RELEASE); //detiene el motor cuando se suelta el botón
  /*motor3.setSpeed(0); //Define la velocidad mínima
  motor3.run(RELEASE); //detiene el motor cuando se suelta el botón
  motor4.setSpeed(0); //Define la velocidad mínima
  motor4.run(RELEASE); //detiene el motor cuando se suelta el botón*/
}