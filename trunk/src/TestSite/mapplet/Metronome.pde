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
  color dgray = color(41,39,39);
  color lgray = color(116,116,135); //227
  color gray = color(87,87, 102);
  color white = color(256);
  color aquamarine = color(127,255,212);
  color viored = color(89,22,23);
  color fred = color(158,76,77);
  color pillRed = color(255,0,0);
  color brue = color(0,0,255);
  Minim minim = new Minim(this);
  int starttime;
  AudioSample pitchA;
  AudioSample tick;
  RadioButton r;
  AudioPlayer tone;
  
  //stuff for metronome
  float bpm = 80;
  float rate = bpm/60;
  Knob knobby;
  Slider s; 
  
  public void setup() { // ---------------------------------set up ---------------------------------
    controlP5 = new ControlP5(this);
    starttime = 60;
    size(350, 350);
    background(gray);
    fill(gray);
    pitchA = minim.loadSample("A 440.mp3");
    tone = minim.loadFile("A 440.mp3");
    tick = minim.loadSample("tick.wav");
    rect(0, 0, 350, 35);
    arialFont = loadFont("Arial14.vlw");
    textFont(arialFont, 24);
    fill(pillRed);
    text("METRONOME", 7, 3, 350, 350);
    textFont(arialFont, 18);
    fill(white);
    text("Use the slider to change the tempo (bpm).", 10, 36, 350, 350);
    textFont(arialFont, 54);
    fill(lgray);
    text("ATLANTA", 7, 150, 350, 350);
    fill(fred);
    text("MUSIC", 7, 205, 350, 350);
    fill(lgray);
    text("PROJECT", 7, 260, 350, 350);

//    controlP5.addButton("A 440 Hz", 0, 10, 70, 60, 20); 
//    controlP5.addButton("Tick", 0, 80, 70, 60, 20); // ( , , x, y,width,height)
    //controlP5.addNumberbox("Beats per minute", 100,100,60,20);
//    knobby = controlP5.addKnob("BPM",40,210,80,50,90,250);
//    knobby.setCaptionLabel(knobby.getValue()+"BPM");
      s = controlP5.addSlider("BPM",60,210,80,10,100,300,30);
    //text("Type desired beats per minute for metronome. (Default = 80 bpm");
    //s.setColorActive(aquamarine);
    s.setColorBackground(red);
    s.setColorForeground(pillRed);
      frameRate(rate);
}
  void draw() { // -----------------------------------draw---------------------------------
  tick.trigger();
  }

//    void keyPressed(){
//      if(key == '\n'){
//        saved = input;
//        input = "";
//      }else{
//        input = input + key;
//      }
//    }
  void controlEvent(ControlEvent theEvent) { // -----------------------------Event stuff for textboxes--------------------------    
//    if (theEvent.controller().name() == "A 440 Hz") {  
//      if (enableA) {
//        //pitchA.trigger();
//        tone.loop();
//        enableA = false;
//      }
//      else {
//        enableA = true;
//        tone.pause();
//      }
//    }
//     if (theEvent.controller().name() == "Tick") {  
//      if (ontick) {
//        tick.trigger();
//        ontick = false;
//      }
//      else {
//        ontick = true;
//        pitchA.stop();
//      }
//     }
      
      if(theEvent.controller().name() == "BPM"){
         bpm = s.value();
         rate = bpm/60;
         frameRate(rate);
      }

  }
//  
//  void knob(int value){
//    knobby.setValue(value);
//    knobby.setCaptionLabel(value +" BPM");
//  }
//  
//  void knobValue(int value){
//    knobby.setCaptionLabel(value + " BPM");
//  }
//  
  void stop() {
    // always close Minim audio classes when you are done with them
    pitchA.close();
    tick.close();
    minim.stop();
    tone.close();
    super.stop();
    
  }

