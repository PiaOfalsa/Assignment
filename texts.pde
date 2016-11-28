class Texts{
   int xpos;//x pos
   int ypos;
   
   int xpos2;//x pos
   int ypos2;
   PFont smallHero;
   PFont small;

  Texts()
  {
    xpos=1150;
    ypos=-160;
    
    
    
    xpos2=1150;
    ypos2=240;
    
    smallHero = loadFont("smallHero.vlw");
    small= loadFont("Calibri-Bold-10.vlw");
  }
  
    void displayTexts()
  {
    fill(172,247,249);
    
    textFont(smallHero);
    textSize(30);
    text("B A S E L I N E",xpos,ypos);
    stroke(172,247,249);
    strokeWeight(7);
    textFont(smallHero);
    textSize(30);
    text("P A T I E N T ",xpos2,ypos2);
 
    
    
  }
  
  
  void displaySymptoms(){
   
    fill(172,247,249);
    stroke(172,247,249);
    strokeWeight(100);
    
    textFont(small);
    textSize(10);
    text("No Physical injury ",200,100);
  
  
  }
}