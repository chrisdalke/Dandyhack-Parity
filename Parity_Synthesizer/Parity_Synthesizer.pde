/*
   ___           _ _         
  / _ \__ _ _ __(_) |_ _   _ 
 / /_)/ _` | '__| | __| | | |
/ ___/ (_| | |  | | |_| |_| |
\/    \__,_|_|  |_|\__|\__, |
                       |___/ 
//////////////////////////////////////////////////
A digital band with some really cool instruments
//////////////////////////////////////////////////

Instruments:
- The Air Drums
- The Button Down Shirt
- The Bachelor Pad
- The Electric Hands

DandyHacks 2016

*/

//////////////////////////////////////////////////
// Program Setup
//////////////////////////////////////////////////

import processing.serial.*;
import controlP5.*;
import processing.sound.*;

Serial port;
int lastData;
int statusMode = 0;


ControlP5 cp5;
ControlWindow controlWindow;
SinOsc testSoundWave;

PImage logo;

void setup(){
  /*
  fullScreen(P2D);
  pixelDensity(displayDensity());*/
  size(640,480,OPENGL);
  smooth(4);
  
  
  //Setup initial controls
  
  cp5 = new ControlP5(this);
  /*
  cp5.addButton("connect")
     .setValue(0)
     .setPosition(100,70)
     .setSize(200,19)
     .setLabel("Connect to Arduino");
     
  cp5.addButton("testSound")
     .setValue(0)
     .setPosition(100,100)
     .setSize(200,19)
     .setLabel("Test Sound");*/
  
  //Setup test sound
  testSoundWave = new SinOsc(this);
  testSoundWave.amp(1.0);
  testSoundWave.freq(326.22);
  
  
  
  //Setup logo image
  logo = loadImage("media/logo.png");
  
  setupSerialConnection();
  
}

void setupSerialConnection(){
  //setup the Serial port communication
  //We will loop until we find a Serial connection that works successfully
  
  boolean connected = false;
  while (!connected){
    //Loop through all the connections we can find
    println("Trying to connect...");
    int i = 0;
    innerloop:
    for (i = 0; i < Serial.list().length ; i++){
      try {
        String portName = Serial.list()[i];
        //if the port is not a tty port, invalidate it
        if (!(portName.matches("(.*)usbmodem(.*)") | portName.matches("(.*)COM(.*)"))){
          println("Invalid port name "+portName);
          portName = "";
        }
        
        port = new Serial(this, portName, 9600);
        connected = true;
        println("Connected to port "+Serial.list()[i]);
        break innerloop;
      } catch (Exception e){
        connected = false;
        port = null;
        println("Couldn't connect on port "+i);
      }
      
    }
  
    //Wait a few seconds between trying a connection again
    delay(1000);
  }
  
  //Once it works, reset our data
  lastData = 0;
  
  println("Connection successful!");
}

public void testSound(int theValue) {
  println("Playing sound...");
  //playSound(300,500);
}

public void connect(int value){
  println("Reconnecting to Arduino...");
  setupSerialConnection();
}
/*
void playSound(int freq, int duration){
  testSoundWave.play(freq,1.0);
  delay(duration);
  testSoundWave.stop();
}*/

//////////////////////////////////////////////////
// Draw Routine
//////////////////////////////////////////////////

void draw(){ 
      //Main program
      
      background(2,30,71);
      
      //Get some port data if it is available
      
      while (0 < port.available()){
        try {
        String input = port.readString();
        input = input.trim();
        input = input.replace("/(\r\n|\n|\r)/gm","");
        input = input.replace("/[^0-9]+/", "");
        lastData = Integer.parseInt(input);
        //println("Reading info! lastData = "+lastData);
        } catch (Exception e) {
          lastData = 0;
        }
      }
      
      if (lastData == 0){
       // background(0);
        //testSoundWave.stop();
      } else {
       // background(255);
        //testSoundWave.play();
        //playSound(800,100);
      }
}

void stop() {
  println("Closing connection...");
  port.stop();
} 

//////////////////////////////////////////////////
// End of Code
//////////////////////////////////////////////////