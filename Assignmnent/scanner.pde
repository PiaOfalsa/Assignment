
class Scanner {
  //declare var
  float circumEffect;//stores number of PI
  float radius;//stores radius
  float FrameCo;//frame count
  float start;
  float stop;

//position of the arc
  int ArcX;
  int ArcY;

  Scanner() {
    //init var
    circumEffect = 4* TWO_PI; //to create the circle effect
    radius=0;
    FrameCo=0;
    start=0;//starting angle
    stop=0;//end angle
    
    //position of the arc
    ArcX=200;
    ArcY=230;
  }
  
    void drawScan()
    {
    
        ScanHs.drawScanH();//calls horizontal scanner
        strokeCap(ROUND);//gives a rounded edge of the arc limne
        colorMode(RGB);
        noFill();
        
        float FrameCo = frameCount*0.02;
        for (int radius=480; radius<800; radius+=220)
        {
    
          //NOISE
          /*
                    Returns the Perlin noise value at
           specified coordinates.
           Perlin noise is a random
           sequence generator producing
           a more natural, harmonic succession
           of numbers than that of the standard random() function. 
           
           */
          float start = circumEffect*noise(radius, FrameCo);//starting angle of arc
          float stop = circumEffect*noise(FrameCo *2, radius);//end angle point
    
          //if absolute value of a-v is LESS THAN PI
          if (abs(start-stop)<PI) {
            strokeWeight(4);
            stroke(color(0, random(244, 249), random(244, 249)));//light blue/turqoise
          } 
    
          //arc(x,y,width,height,start angle,stop angle)
          arc(ArcX, ArcY, radius, radius, min(start, stop), max(start, stop));
        }
  }
}//end class