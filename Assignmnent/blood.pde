
//BLOOD CELL ACTIVITY
class BloodCell {
  PVector pos;//store blood circle position
  float r;//stores radius
  PVector vel;//velocity so it can move around

  BloodCell(float x, float y) {
    pos = new PVector(x, y);//location of blood
    vel = PVector.random2D();//gives random vector unit pointing in a random direction
    vel.mult(random(10, 50));//random speed scale by random amount
    r = random(300, 900);//radius
  }

  //velocity is added to the object
  void update() {
    // stroke(255);
      
    pos.add(vel); 
    //so it bounces of the edge
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }

    textSize(30);
    text("B L O O D   C E L L S    A C T I V I T Y", -130, -180);
  }

//function to see blood cell
  void show() {


    noFill();
    stroke(255, 0, 0);
    strokeWeight(10);
    ellipse(pos.x, pos.y, r*5, r*5);
  }
}