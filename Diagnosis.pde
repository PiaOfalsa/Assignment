class Diagnosis{
   int x;
   int y;
   PFont big;
   
  
 
  Diagnosis(){
    x=-650;
    y=-60;
    big = loadFont("BigHero.vlw");
   
  }
  

  void control(){
        
    fill(172,247,249);
    textSize(40);
    textFont(big);
    text("D I A G N O S I S",x,y);
    stroke(172,247,249);
    strokeWeight(7);
    //displayLine();
  
  
  }
}