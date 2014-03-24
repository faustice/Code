/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
  PImage unicorn;
  PImage sassy;
  int sassX = 0;
  int sassY = 0;
void setup() 
{
  size(800, 800);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  unicorn = loadImage("unicorn-mask.jpg");
    sassy = loadImage("sassy.png");

}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();     // read it and store it in val
    
  }
  background(255);             // Set background to white
  if (val == 1) {              // If the serial value is 0,
      sassX --;
  } 
  else {                       // If the serial value is not 0,
        sassX ++;             // set fill to light gray
  }
  image(unicorn, 0, 0);
  image(sassy, sassX, sassY);
}

