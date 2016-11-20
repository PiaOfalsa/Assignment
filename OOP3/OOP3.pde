/* Attempt 3

  OOP ASSIGNMENT
  C15734155
*/
Diagnosis dia;
Grid grids;
PImage backg;
int[] angles = { 5, 10, 45, 35, 60, 38, 75, 88 };

void setup(){
  size(1920,800);
  
  backg = loadImage("HIRO.jpg");
  image(backg,0,0);
  dia = new Diagnosis();
  grids = new Grid();
 
}

void draw(){
  //updateBack();
  dia.displayLine();
  pieChart(220, angles);
  grids.displayGrid();
  
}

void updateBack(){
  image(backg,0,0);  
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    noStroke();
    fill(0,random(255),255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}