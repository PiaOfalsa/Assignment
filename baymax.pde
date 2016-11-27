class Baymax
{
  PImage cope;
  PFont smallHero;
   int x;
   int y;
   PFont big;
  
  Baymax(){
     x=-650;
    y=-60;
    big = loadFont("BigHero.vlw");
    cope = loadImage("baycope.png");
     smallHero = loadFont("smallHero.vlw"); 
  }

  void drawBay(){
    
    
        background(108,231,247);
        
      //lower body
        strokeWeight(1);
        stroke(#CE2C2C);
        fill(255);
        
        //x,y,width,height
        ellipse(450,345, 400,300);
        //upper bod
        stroke(#CE2C2C);
        fill(255);
        ellipse(450,200, 300,140);
        fill(0);
        //eyes
        noStroke();
        ellipse(360,200, 30,30);
        fill(0);
        ellipse(550,200, 30,30);
        stroke(0);
        strokeWeight(4);
        line(360,200,540,200);
        image(cope, 400, 280);
        
        fill(255);
        stroke(255);
        strokeWeight(7);
    textFont(smallHero);
        textSize(30);
        textAlign(CENTER-RIGHT);
        text("HELLO ",700,100);
        text("I AM BAYMAX",700,140);
        text("YOUR PERSONAL",700,160);
        text("HEALTHCARE ",700,210);
        text("COMPANION",700,260);

  }
  


  
}