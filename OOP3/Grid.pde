class Grid
{
  int x;
  int y;
  float col;
  Grid()
  {
    x=1600;
    y=50;
    col=255;
   
  }
  
 void displayGrid(){
   
   strokeWeight(1);
   
   for(y=100;y<height-600;y=y+50){
     for(x=1600;x<width-100;x=x+50)
     {
       stroke(random(255));
       fill(0,random(col),255);
       
       rect(x,y,60,60);
       
     }  
   }
   
 }

}