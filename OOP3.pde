/* Attempt 3

  OOP ASSIGNMENT
  C15734155
*/


Diagnosis dia;
Grid grids;
PImage backg;
PImage bod;
PImage brain;
PImage brain2;
int[] angles = { 5, 10, 45, 35, 60, 38, 75, 88 };

//circle var
float a, b, t;
float B=0;

int col[];//color


void setup(){
  size(1920,800);
  
  backg = loadImage("HIRO.jpg");
  bod = loadImage("bod.gif");
  brain = loadImage("brain.png");
  brain2 = loadImage("brain.png");
 
  dia = new Diagnosis();
  grids = new Grid();
  
}

void draw(){ 
 
  updateBack();
  
  pushMatrix();
  translate(width/2, height/2);

  dia.displayLine();
  popMatrix();
  
  pieChart(220, angles);
  grids.displayGrid();
  heart();
   
}


void updateBack(){
  image(backg,0,0);
  image(bod,50,140);
  image(brain,1300,100);
  image(brain2,1300,550);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(0,random(255),255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);}
  }
  
void heart(){
  smooth();
noStroke();
for(int i=0; i<3;i++){
fill(random(255),0,0);
}
 translate(180,290);
beginShape();
vertex(50, 15); 
bezierVertex(50, -5, 90, 5, 50, 40); 
vertex(50, 15); 
bezierVertex(50, -5, 10, 5, 50, 40); 
endShape();

}