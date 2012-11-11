import processing.core.*; 
import processing.xml.*; 

import prohtml.*; 
import controlP5.*; 
import javax.swing.text.html.parser.*; 
import javax.swing.*; 
import java.net.*; 
import java.io.*; 
import java.util.*; 
import jgroove.jsonx.*; 
import ddf.minim.*; 

import jgroove.jsonx.*; 
import ddf.minim.analysis.*; 
import prohtml.*; 
import controlP5.*; 
import jgroove.json.*; 
import ddf.minim.effects.*; 
import ddf.minim.*; 
import ddf.minim.signals.*; 
import jgroove.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class ConcertPitch extends PApplet {











//removed class declaration 

  PFont arialFont;
  ControlP5 controlP5;
  // Textfield myTextfield;
  ControlWindow controlWindow;
  //Textlabel errorLabel1;
  Button buttA, butttick;
  int blue = color(18, 38, 50);
  int red = color(129, 4, 4);
  int gray = color(200, 200, 200);
  int white = color(256);
  Minim minim = new Minim(this);
  int starttime;
  boolean enableA, ontick;
  AudioSample pitchA;
  AudioSample tick;
  RadioButton r;
  AudioPlayer tone;
    int lgray = color(116,116,135); //227
  int fred = color(158,76,77);
  public void setup() { // ---------------------------------set up ---------------------------------
    enableA = true;
    controlP5 = new ControlP5(this);
    starttime = 60;
    size(350, 350);
    background(0);
    fill(red);
    pitchA = minim.loadSample("A 440.mp3");
    tone = minim.loadFile("A 440.mp3");
    tick = minim.loadSample("tick.wav");
    rect(0, 0, 350, 35);
    fill(white);
    arialFont = loadFont("Arial14.vlw");
    textFont(arialFont, 24);
    text("CONCERT PITCH", 7, 3, 350, 350);
    textFont(arialFont, 18);
    text("Press button to toggle A440 on and off.", 10, 36, 350, 350);
    controlP5.addButton("A 440 Hz", 0, 120, 70,70, 70);  // ( , , x, y,width,height)
   textFont(arialFont, 54);
    fill(lgray);
    text("ATLANTA", 7, 150, 350, 350);
    fill(fred);
    text("MUSIC", 7, 205, 350, 350);
    fill(lgray);
    text("PROJECT", 7, 260, 350, 350);
     }
  public void draw() { // -----------------------------------draw---------------------------------
  
  }

  public void controlEvent(ControlEvent theEvent) { // -----------------------------Event stuff for textboxes--------------------------    
    if (theEvent.controller().name() == "A 440 Hz") {  
      if (enableA) {
        //pitchA.trigger();
        tone.loop();
        enableA = false;
      }
      else {
        enableA = true;
        tone.pause();
      }
    }
     if (theEvent.controller().name() == "Tick") {  
      if (ontick) {
        tick.trigger();
        ontick = false;
      }
      else {
        ontick = true;
        pitchA.stop();
      }
     }
  }
  public void stop() {
    // always close Minim audio classes when you are done with them
    pitchA.close();
    tick.close();
    minim.stop();
    tone.close();
    super.stop();
    
  }

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "ConcertPitch" });
  }
}
