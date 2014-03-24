import processing.serial.*; 
 boolean mouseOver = false;
 
 Serial port; 
 
 void setup()  {
 size(500, 500);
 
 // List all the available serial ports in the output pane. 
 // You will need to choose the port that the Arduino board is 
 // connected to from this list. The first port in the list is 
 // port #0 and the third port in the list is port #2. 
 println(Serial.list()); 
 
 // Open the port that the Arduino board is connected to (in this case #0) 
 // Make sure to open the port at the same speed Arduino is using (9600bps) 
 port = new Serial(this, Serial.list()[2], 9600); 
 
 }
 
 void draw() 
 { 
 background(0);
 
 // Test where the ball is
 if (mouseX > 0 && mouseX < 200 && 
 mouseY > 0 && mouseY < 200) {
 mouseOver = true;  
 // draw a line around the ball and change its color:
 stroke(255); 
 fill(153);
 //send an 'H' to turn the servo:
 port.write('H');       
 } 
 else {
 stroke(153);
 fill(153);
 // send an 'L' to turn the servo the other way: 
 port.write('L');      
 mouseOver = false;
 }
ellipse(mouseX, mouseY, 100, 100);
 }
 
 
 
