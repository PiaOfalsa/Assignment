class Texts{
   int xpos;//x pos
   int ypos;
   
   int xpos2;//x pos
   int ypos2;
   PFont smallHero;

  Texts()
  {
    xpos=1150;
    ypos=-160;
    
    
    
    xpos2=1150;
    ypos2=240;
    smallHero = loadFont("smallHero.vlw"); 
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
    void displayTexts2()
  {
    
    stroke(172,247,249);
    strokeWeight(100);
    textSize(30);
    textFont(smallHero);
    text("H E L L O   I  A M    B A Y M A X  ",xpos2,ypos2);
    text("PRESS AND HOLD THE MOUSE TO CONTINUE  ",xpos2,400);
    
    
  }
}