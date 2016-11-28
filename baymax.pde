

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
        smallHero = loadFont("BigHero-30.vlw"); 
    }

  void drawBay(){
    
  
    translate(500,100);
        //background(108,231,247);
        background(255,0,0);
        
      //lower body
        strokeWeight(1);
        stroke(#CE2C2C);
        fill(255);
        
        //x,y,width,height
        ellipse(450,455, 700,600);
        //upper bod
        stroke(#CE2C2C);
        fill(255);
        ellipse(450,200, 400,240);
        fill(0);
        //eyes
        noStroke();
        ellipse(360,200, 40,40);
        fill(0);
        ellipse(550,200, 40,40);
        stroke(0);
        strokeWeight(4);
        line(360,200,540,200);
        image(cope, 400, 280);
        
        fill(255);
        stroke(255);
        strokeWeight(7);
        textFont(smallHero);
        textSize(30);
        //textAlign(CENTER-RIGHT);
        text("B I G ",-440,-20);
        text("H E R O",-440,20);
        text("S I X",-440,60);
        
        

        
 
   

  }
  


  
}