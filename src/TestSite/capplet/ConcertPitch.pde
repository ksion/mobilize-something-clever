import prohtml.*;
import controlP5.*;
import javax.swing.text.html.parser.*;
import javax.swing.*;
import java.net.*;
import java.io.*;
import java.util.*;
import jgroove.jsonx.*;
import ddf.minim.*;

//removed class declaration 

  PFont arialFont;
  ControlP5 controlP5;
  // Textfield myTextfield;
  ControlWindow controlWindow;
  //Textlabel errorLabel1;
  Button buttA, butttick;
  color blue = color(18, 38, 50);
  color red = color(129, 4, 4);
  color gray = color(200, 200, 200);
  color white = color(256);
  Minim minim = new Minim(this);
  int starttime;
  boolean enableA, ontick;
  AudioSample pitchA;
  AudioSample tick;
  RadioButton r;
  AudioPlayer tone;
    color lgray = color(116,116,135); //227
  color fred = color(158,76,77);
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
  void draw() { // -----------------------------------draw---------------------------------
  
  }

  void controlEvent(ControlEvent theEvent) { // -----------------------------Event stuff for textboxes--------------------------    
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
  void stop() {
    // always close Minim audio classes when you are done with them
    pitchA.close();
    tick.close();
    minim.stop();
    tone.close();
    super.stop();
    
  }

