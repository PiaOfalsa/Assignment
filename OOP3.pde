/* Attempt 3
 
 OOP ASSIGNMENT
 C15734155
 */

//declare class
import ddf.minim.*;

Minim minim;
AudioPlayer hello;
AudioPlayer beep;


Scanner scan;
Diagnosis dia;

Heart heart;
Texts texts;
Baymax bay;

BloodCell[] bloods = new BloodCell[10];

//to store image files
PImage backg;
PImage bod;
PImage brain;
PImage brain2;
PFont fontgraph;

PFont big;
int t=millis()+20000;
//array of angles for pie chart
int[] angles = { 5, 10, 45, 35, 60, 38, 75, 88 };

int [] array ={80, 10, 80, 100, 30, 6, 140, 70, 99};

//line graph details
String filename ="data.csv";
String [] rawData;
int [] years= new int[5];
int[] injuries = new int[5];



int margin, graphHeight;
float xSpacer;

PVector [] positions= new  PVector[5];

//container for pos info
//keep track of x and y var


int overallMin = min(injuries);
int overallMax= max (injuries);


boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];
  }
  return false;
}



void setup() {
  
  
  frameRate(9);
  fontgraph= loadFont("smallHero.vlw"); 
 
  bay=new Baymax();
  size(1920, 800);
  bay.drawBay();
  

  colorMode(HSB);
  for (int i = 0; i < bloods.length; i++) {
    bloods[i] = new BloodCell(random(width), random(height));
  }
 
  minim=new Minim(this);
  hello = minim.loadFile("Hello.mp3");
  beep = minim.loadFile("beep.mp3");
  hello.play();
 
 
  backg = loadImage("HIRO.jpg");
  bod = loadImage("bod.gif");
  brain = loadImage("brain.png");
  brain2 = loadImage("brain.png");

  //create new object
  scan =new Scanner();
  dia = new Diagnosis();

  heart= new Heart();
  texts=new Texts();
  
  processData();
}

void draw() { 

  // bay.drawBay();

  if (frameCount>45)
  {
    beep.play();
    updateBack();

    pushMatrix();
    translate(700, 150);
    dia.control(); 
    scan.drawScan();
    popMatrix();
    pieChart(220, angles);
    heart.heart();

    graph();
    drawInterF();
    texts.displayTexts();
    texts.displaySymptoms();
 
    strokeWeight(4);  
    textSize(28);
    drawInterF();

    fill(0, random(255), random(255));
    //load values
    for (int i=0; i<positions.length; i++) {
      ellipse(positions[i].x, positions[i].y, 15, 15);
     
    }
    
   
    if (keyPressed)
    {
        if (key == 'b' || key == 'B')
        {
          loop();
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
      pixels[index] = color(255,sum%140,sum%255);
    }
  }

  updatePixels();

  for (BloodCell b : bloods) {
    b.update();
    //b.show();
  }        
     }
   }  
    
  }//end if
  
}

void updateBack() {
  image(backg, 0, 0);
  image(bod, 50, 140);
  image(brain, 1340, 170);
  image(brain2, 1340, 560);
}

//piechartt
void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(0, random(255), 255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}

//graph
void graph() {

  stroke(255);
  for (int i=0; i<array.length; i++) {

    float rectWidth = 260/(array.length);//x
    float value = random(array[i] );
    float ypos = 150 - value;//y position
    fill(0, random(255), 255);

    rect((rectWidth *i)+1420, ypos, rectWidth, value);
    
    
  }
}

void drawInterF()
{
  //background(0);
  //vert lines
  for (int i=0; i<positions.length; i++) {
    stroke(200, 100);
    
    textSize(10);
    line(positions[i].x, -80, positions[i].x, height/2-280- margin);
    
    text(years[i], positions[i].x-10, height/2-310 - margin +15); 

    if (i>0) {
      stroke(200);
      line(positions[i].x, positions[i].y, positions[i-1].x, positions[i-1].y);
    }
  }

  
 
}

void processData() {


  rawData = loadStrings(filename);

  for (int i=1; i<rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    years[i-1]=int(thisRow[1]);
    injuries[i-1]=int(thisRow[2]);
  }
  overallMin = min(injuries);
  overallMax= max (injuries);


  margin =300;
  graphHeight = (height-100-margin) - margin;
  xSpacer = (width/2-100 - margin - margin)/(years.length -1);

  for (int i=0; i<injuries.length; i++) {


    float adjScore = map(injuries[i], overallMin-50, overallMax-50, 50, graphHeight);
    float yPos = height/2-150 - margin -adjScore;
    float xPos = margin+1120+ (xSpacer *i);
    positions[i]=new PVector(xPos, yPos);
  }
}
   