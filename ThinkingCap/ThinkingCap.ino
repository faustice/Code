const int motorPin = 3; // pin for vibrating motors
int potPin = A0;    // input pin for the potentiometer
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup()
{
pinMode(motorPin, OUTPUT); 
pinMode(potPin, INPUT);
Serial.begin(9600);
}

void loop()
{
  int val = analogRead(A0);
  val = map(val, 0, 1023, 0, 255);
  analogWrite(motorPin, val);
  delay(100);
  
  if ( val == 255 ) {
    digitalWrite(motorPin, HIGH);
delay(500);
digitalWrite(motorPin, LOW);
delay(50); }
}
