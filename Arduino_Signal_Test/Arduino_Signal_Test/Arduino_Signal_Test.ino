void setup() {
  // put your setup code here, to run once:
  pinMode(13, OUTPUT);
  
  Serial.begin(9600);
  
}
int sensorReading0 = 0;
int sensorReading1 = 0;
int sensorReading2 = 0;
int sensorReading3 = 0;
int sensorReading4 = 0;
int sensorReading5 = 0;
int sensor0Delta = 0;
int sensor1Delta = 0;
int sensor2Delta = 0;
int sensor3Delta = 0;
int sensor4Delta = 0;
int sensor5Delta = 0;

char charbuffer[6];

const int threshold0 = 30;
const int threshold1 = 30;
const int threshold2 = 30;
const int threshold3 = 100;
const int threshold4 = 30;
const int threshold5 = 30;
void loop() {
  // put your main code here, to run repeatedly:
  /*
  digitalWrite(13, HIGH);
  Serial.write(1);
  delay(100);
  
  
  digitalWrite(13, LOW);
  Serial.write(0);
  delay(2000);*/
  
  sensor0Delta = abs(sensorReading0 - analogRead(A0));
  sensorReading0 = analogRead(A0);
  sensor1Delta = abs(sensorReading1 - analogRead(A1));
  sensorReading1 = analogRead(A1);
  sensor2Delta = abs(sensorReading2 - analogRead(A2));
  sensorReading2 = analogRead(A2);
  sensor3Delta = abs(sensorReading3 - analogRead(A3));
  sensorReading3 = analogRead(A3);
  sensor4Delta = abs(sensorReading4 - analogRead(A4));
  sensorReading4 = analogRead(A4);
  sensor5Delta = abs(sensorReading5 - analogRead(A5));
  sensorReading5 = analogRead(A5);
  if (sensor5Delta > threshold0){
    Serial.println("5");
  }
  if (sensor4Delta > threshold1){
    //Serial.println("4");
  }
  if (sensor3Delta > threshold2){
    Serial.println(sensor3Delta);
  }
  if (sensor2Delta > threshold3){
    Serial.println("2");
  }
  if (sensor1Delta > threshold4){
    Serial.println("1");
  }
  if (sensor0Delta > threshold5){
    Serial.println("0");
  }
  
  
  /*
  if (sensorReading0 >= threshold) {
    Serial.println(1);
  } else { 
    Serial.println(0);
  }*/
  
  delay(100); 
  
}
