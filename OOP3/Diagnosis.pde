class Diagnosis{
  
  int x;
  int x2;
  int y;
  int y2;
  Diagnosis(){
   x=70;
   x2=70;
   y=70;
   y2=140;
   
  }
  
  void displayLine()
  {
    fill(172,247,249);
    textSize(40);
    text("D I A G N O S I S",65,60);
    stroke(172,247,249);
    strokeWeight(9);
 
    point(x++,y);
    
    if(x>380)
    {
      x=300;
    }
    
    
   
     point(x2,y2--);
     if(x2==70 && y2<70)
     {
       y2=70;
     }
     
  
    
  }
}