//vertical scanner
class Final{
int y;
  Final(){
  y=0;
 
  }
  
  void drawFinal(){
  //final frame
  //Diagnosis Puberty 
  noStroke();
  rect(-200,y,800,5);
  y= y+20;
  
  if(y>height && y==-1)
  {
    y=0;
  }
  }
}