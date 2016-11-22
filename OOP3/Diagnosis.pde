class Diagnosis{
   int x;
   int y;
  
 
  Diagnosis(){
    x=-650;
    y=-60;
   
  }
  
  void displayLine()
  {
    fill(172,247,249);
    textSize(40);
    text("D I A G N O S I S",x,y);
    stroke(172,247,249);
    strokeWeight(7);
 
    
    
  }
}