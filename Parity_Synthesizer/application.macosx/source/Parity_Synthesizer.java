import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Parity_Synthesizer extends PApplet {

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

public void setup(){
  
}

//////////////////////////////////////////////////
// Draw Routine
//////////////////////////////////////////////////

public void draw(){ 
  if (mousePressed){
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX,mouseY,80,80);
}

//////////////////////////////////////////////////
// End of Code
//////////////////////////////////////////////////
  public void settings() {  size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Parity_Synthesizer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
