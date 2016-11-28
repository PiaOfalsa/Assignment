class Texts{
   int xpos;//x pos
   int ypos;
   int x;
   int xpos2;//x pos
   int ypos2;
   
   float begin; 
   float duration;
   float time;
   
   PFont smallHero;
   PFont small;
   PFont symp;
   PFont symps;

  Texts()
  {
    x=180;
    xpos=1150;
    ypos=-160;
    
    
    
    xpos2=1150;
    ypos2=240;
    
    smallHero = loadFont("smallHero.vlw");
    small= loadFont("Calibri-Bold-10.vlw");
    symp= loadFont("Ebrima-Bold-30.vlw");
    symps= loadFont("Ebrima-Bold-15.vlw");
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
    
    textFont(symp);
    //textAlign(CENTER);
    textSize(30);
    text("      . . .    ",180,-80);
    
    textSize(15);
    text("GPR54 Detected",180,-50);
    text("High levels GnRH",180,-20);
    text("Increade Pituitary Activity",180,10);
    text("High Testosterone",180,40);
    text("Vocal Flucatuation",180,70);
    text("Emotional Instability",180,100);
    
    //numbers
    noFill();
    stroke(172,247,249);
    strokeWeight(3);
    rect(180,250,180,90);
     rect(190,260,80,30);
    begin = millis();
    time = duration = random(150,200);
    if (time > 0)  time = duration - (millis() - begin)/90;
    textSize(30);
    text(time, 180, 325);
  
  
  }
}