/* Attempt 3

  OOP ASSIGNMENT
  C15734155
*/


Diagnosis dia;
Grid grids;
PImage backg;
int[] angles = { 5, 10, 45, 35, 60, 38, 75, 88 };

//circle var
float a, b, t;
float B=0;

int col[];//color


void setup(){
  size(1920,800);
  
  backg = loadImage("HIRO.jpg");
  image(backg,0,0);
  
  dia = new Diagnosis();
  grids = new Grid();
  
  col=new int[]
  {
    color(0,255,255), color(0, 255,255)
  };
}

void draw(){ 
 
  updateBack();
  
  b=radAbso(b+radians(1));  

  pushMatrix();
  translate(width/2, height/2);

  drawCircle();
  dia.displayLine();
  popMatrix();
  
  pieChart(220, angles);
  grids.displayGrid();
   
}

// RADIAN absolute calculation

float radAbso(float a) {
  while (a<0) {
    a+=TWO_PI;
  } 
  while(a>TWO_PI) {
    a-=TWO_PI;
  } 

  return a;
}


float radLerp(float a, float b, float t) {
  float D=radShort(a, b);
  return a+D*t;//a+D*t;
}

float radShort(float a, float b) {
  float D, D2;

  D=radAbso(b-a);
  D2=-radAbso((a-b));

  if (abs(D)>abs(D2)) D=D2;
  return D;
}


// DRAWING METHODS

void drawCircle() {
  float r;
  noFill();
  stroke(255);//0,100,200);
  strokeWeight(3);

  r=300;  
  ellipse(-30, 0, r*2, r*2);
  
  stroke(col[1]);
  r=320;
  arc(-30, 0, r*2, r*2, 0, b);

}


//background

void updateBack(){
  image(backg,0,0);  
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(0,random(255),255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);}
  }