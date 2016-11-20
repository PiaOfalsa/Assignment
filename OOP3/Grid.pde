class Grid
{
  int x;
  int y;
  
  Grid()
  {
    x=1600;
    y=50;
  }
  
 void displayGrid(){
   stroke(255);
   strokeWeight(1);
   fill(0,0,random(255));
   for(y=50;y<height-600;y=y+50){
     for(x=1600;x<width-100;x=x+50)
     {
       rect(x,y,60,60);
     }
   }
 }

}