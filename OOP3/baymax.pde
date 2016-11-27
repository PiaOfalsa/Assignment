class Baymax
{
   int x;
   int y;
   PFont big;
  
  Baymax(){
     x=-650;
    y=-60;
    big = loadFont("BigHero.vlw");
  }

  void drawBay(){
    
      
        for(int i=0;i<5;i++){
        background(random(255)+i,random(255),random(255));
        }
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
        

  }
  


  
}