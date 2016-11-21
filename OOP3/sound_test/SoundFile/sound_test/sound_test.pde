  
import processing.sound.*;
SoundFile soundfile;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  soundfile = new SoundFile(this, "DyingRobot.mp3");
  soundfile.play();
}      

void draw() {
}