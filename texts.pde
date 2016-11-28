class Texts{
   int xpos;//x pos
   int ypos;
   
   int xpos2;//x pos
   int ypos2;
   PFont smallHero;
   PFont small;
   PFont symp;

  Texts()
  {
    xpos=1150;
    ypos=-160;
    
    
    
    xpos2=1150;
    ypos2=240;
    
    smallHero = loadFont("smallHero.vlw");
    small= loadFont("Calibri-Bold-10.vlw");
    symp= loadFont("Ebrima-Bold-30.vlw");
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
    strokeWeight(3);
    
    textFont(symp);
    textSize(30);
    text("SYMPTOMS",180,-120);
    line(180,-115,350,-115);
  
  
  }
}