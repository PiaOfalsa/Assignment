class BloodCell {
  PVector pos;
  float r;
  PVector vel;

  BloodCell(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2, 100));
    r = random(120, 600);
  }

  void update() {
  colorMode(HSB);
  textSize(30);
  text("B L O O D   C E L L S    A C T I V I T Y", 50, 50);

    pos.add(vel); 
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void show() {
    noFill();
    stroke(255,0,0);
    strokeWeight(10);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  
  void displayBlood(){
     background(255,0,0);

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (BloodCell b : bloods) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 10 * b.r / d;
      }
      pixels[index] = color(sum, 255, 255);
    }
  }

  updatePixels();

  for (BloodCell b : bloods) {
    b.update();
    //b.show();
  }
   
   }
}