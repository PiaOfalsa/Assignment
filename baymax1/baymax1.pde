/*import controlP5.*;

int armAngle = 0;
int angleChange = 5;
final int ANGLE_LIMIT = 135;
*/

PImage hiro;

void setup() {  //setup function called initially, only once
  size(1000, 700);
  background(255,0,0);
  hiro =loadImage("hiro.png");
  smooth();
  
  drawBaymax();
  
    
  
}



void drawBaymax()
{
  //hello();
  
  //lower body
    strokeWeight(1);
    stroke(#CE2C2C);
    fill(255);
    ellipse(500,500, 500,400);
    
    stroke(#CE2C2C);
    fill(255);
    ellipse(500,300, 370,230);
    fill(0);
    noStroke();
    ellipse(400,300, 30,30);
    fill(0);
    ellipse(600,300, 30,30);
    stroke(0);
    strokeWeight(4);
    line(600,300,400,300);
    //drawLeftArm();
    //drawRightArm();
    
  
}

void draw(){
  
  image(hiro,-500,0);
}

/*

void draw() {  //draw function loops

  background(255,0,0);
  pushMatrix();
  translate(50, 50); // place robot so arms are always on screen
  drawBaymax();
  armAngle += angleChange;
  
  // if the arm has moved past its limit,
  // reverse direction and set within limits.
  if (armAngle > ANGLE_LIMIT || armAngle < 0)
  {
    angleChange = -angleChange;
    armAngle += angleChange;
  }
  popMatrix();

  
}

void drawLeftArm()
{
  pushMatrix();
  translate(12, 32);
  rotate(radians(armAngle));
  rect(-12, 0, 12, 37); // left arm
  popMatrix();
}

void drawRightArm()
{
  pushMatrix();
  translate(66, 32);
  rotate(radians(-armAngle));
  rect(0, 0, 12, 37); // right arm
  popMatrix();
}

void hello()
{
  
  println(PFont.list());
  PFont f= loadFont("Cent.vlw");
  String s ="Hello I am Baymax, your personal health care companion !";
  textFont(f);
  textSize(30);
  textAlign(CENTER);
  fill(0);
  
  text(s,500,100);


}
*/