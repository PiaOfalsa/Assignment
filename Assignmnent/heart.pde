class Heart
{

  float x2;
  float y2;
  float x3;
  float y3;
  float x4;
  float y4;

  Heart() {

    x2=50;
    y2=-5;
    x3=90;
    y3=5;
    x4=50;
    y4=40;
  }

  void heart() {
//draw the heart
    smooth();
    noStroke();
    for (int i=0; i<3; i++) {
      fill(random(255), 0, 0);
    }
    translate(180, 290);
    beginShape();
    vertex(50, 15); //x,y

    //bezierVertex(x2, y2, x3, y3, x4, y4)
    bezierVertex(x2, y2, x3, y3, x4, y4); 
    vertex(50, 15); 
    bezierVertex(x2, y2, 10, y3, x4, y4); 
    endShape();
  }
}