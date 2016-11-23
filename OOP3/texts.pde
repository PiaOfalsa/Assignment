class Texts{
   int xpos;//x pos
   int ypos;
   
   int xpos2;//x pos
   int ypos2;
   PFont smallHero;

  Texts()
  {
    xpos=1200;
    ypos=-210;
    
    xpos2=1200;
    ypos2=280;
    smallHero = loadFont("smallHero.vlw"); 
  }
  
    void displayTexts()
  {
    fill(172,247,249);
    //textSize(40);
    textFont(smallHero);
    text("B A S E L I N E:",xpos,ypos);
    stroke(172,247,249);
    strokeWeight(7);
    textFont(smallHero);
    text("P A T I E N T: ",xpos2,ypos2);
 
    
    
  }
}