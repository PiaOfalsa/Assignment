/* Attempt 3

  OOP ASSIGNMENT
  C15734155
*/

//declare class

Scanner scan;
Diagnosis dia;
Grid grids;
Heart heart;


//to store image files
PImage backg;
PImage bod;
PImage brain;
PImage brain2;

//array of angles for pie chart
int[] angles = { 5, 10, 45, 35, 60, 38, 75, 88 };


void setup(){
  size(1920,800);
  
  backg = loadImage("HIRO.jpg");
  bod = loadImage("bod.gif");
  brain = loadImage("brain.png");
  brain2 = loadImage("brain.png");
  
  //create new object
  scan =new Scanner();
  dia = new Diagnosis();
  grids = new Grid();
  heart= new Heart();
    
}

void draw(){ 
 
  updateBack();
  
  pushMatrix();
  translate(700,150);
  dia.displayLine();
  scan.drawScan();
 
  popMatrix();
  
  pieChart(220, angles);
  grids.displayGrid();
  heart.heart();
   
}

//background /images
void updateBack(){
  image(backg,0,0);
  image(bod,50,140);
  image(brain,1360,100);
  image(brain2,1360,580);
}

//piechartt
void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(0,random(255),255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);}
  }
  