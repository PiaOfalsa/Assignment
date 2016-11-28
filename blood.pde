

class BloodCell {
  PVector pos;
  float r;
  PVector vel;

  BloodCell(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random3D();
    vel.mult(random(10, 50));
    r = random(300, 900);
  }

  void update() {
 // stroke(255);
 
  
  
    pos.add(vel); 
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
    
     textSize(30);
  text("B L O O D   C E L L S    A C T I V I T Y", -130, -180);
  }

  void show() {
    

    noFill();
    stroke(255,0,0);
    strokeWeight(10);
    ellipse(pos.x, pos.y, r*5, r*5);
  }
}