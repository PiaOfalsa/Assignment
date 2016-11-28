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

int [] BarArray ={80, 10, 80, 100, 30, 6, 140, 70, 99};

//line graph variables
String filename ="data.csv";
String [] rawData;
int [] years= new int[5];
int[] injuries = new int[5];
int margin, graphHeight;
float xSpacer;
PVector [] positions= new  PVector[5];//keep track of x and y var mini line graph
int overallMin = min(injuries);
int overallMax= max (injuries);

//variables for brain line graph

 ArrayList<BRAIN> data = new ArrayList<BRAIN>();
 float margins;
 float min, max;


void setup() {
  
  frameRate(10);
  fontgraph= loadFont("smallHero.vlw"); 
 
  bay=new Baymax();
  size(1920, 800);
  bay.drawBay();
  

  colorMode(HSB);
  for (int i = 0; i < bloods.length; i++)
  {
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
  loadData();
  minmax();
  margins = width * 0.1f;
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
    
   
    if (mousePressed)
    {
        if (mouseX >110 && mouseX<240 && mouseY>270 && mouseY<310)
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
   
   //if statement interactive line graph
   
   if (mousePressed)
   
    {
        
        if (mouseX >1200 && mouseX<1500 && mouseY>550 && mouseY<660)
        {
        
        stroke(0);
        textSize(40);
        
        background(172,247,249);
       
        pushMatrix();
        translate(-210, -310);
        
        drawLineGraph();
        drawBRAINBrainwaves();
        popMatrix();
                  
        }//inner if
    }//if brain

   
    
  }//end if control
  
}




void updateBack() {
  image(backg, 0, 0);
  image(bod, 50, 140);
  image(brain, 1340, 170);
  image(brain2, 1340, 560);
  noFill();
  
  stroke(172,247,249);
  rect(15,15,1890,770);
}

//method for pie chart
void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(0, random(255), 255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}

//method for bar graph
void graph() {

    stroke(255);
    for (int i=0; i<BarArray.length; i++) {

    float rectWidth = 260/(BarArray.length);//x
    float value = random(BarArray[i] );
    float ypos = 150 - value;//y position
    fill(0, random(255), 255);

    rect((rectWidth *i)+1420, ypos, rectWidth, value);
    
  }
}

//line graph interface
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

//to read data for line graph
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


//brain line graph


void loadData()
{
  Table t = loadTable("brain.csv");
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    BRAIN brain = new BRAIN(row);
    data.add(brain);
  }
}


void minmax()
{
  min = max = data.get(0).brainwaves; 
  for (BRAIN brain:data)
  {
    if (brain.brainwaves < min)
    {
      min = brain.brainwaves;
    }
    if (brain.brainwaves > max)
    {
      max = brain.brainwaves;
    }    
  }
}


void drawLineGraph()
{
  
  
  stroke(255,0,0);  
  line(margins - 5, height - margins, width - margins, height - margins);
  line(margins, margins, margins, height - margins + 5);
  
  
  for (int i = 1 ; i < data.size() ; i ++)
  {
    stroke(0,0,255);
    float x1 = map(i - 1, 0, data.size() - 1, margins, width - margins);
    float y1 = map(data.get(i - 1).brainwaves, min, max, height - margins, margins);
    float x2 = map(i, 0, data.size() - 1, margins, width - margins);
    float y2 = map(data.get(i).brainwaves, min, max, height - margins, margins);
    line(x1, y1, x2, y2);
    
  }  
  text(" YEARLY BRAIN ACTIVITY ",700,height-margins-500);
}


void drawBRAINBrainwaves()
{
  if (mouseX >= margins && mouseX <= width - margins)
  {
    stroke(255, 255, 0);
    strokeWeight(5);
    fill(255, 255, 0);
    line(mouseX, margins, mouseX, height - margins);
    int i = (int) map(mouseX, margins, width - margins, 0, data.size() - 1);
    float y = map(data.get(i).brainwaves, min, max, height - margins, margins);
    
    
    //ellipse(mouseX, y, 10, 10);
     beginShape();
     vertex(mouseX,y-50);
     vertex(mouseX+14,y-20);
     vertex(mouseX+47,y-15);
     vertex(mouseX+23,y+7);
     vertex(mouseX+29,y+40);
     vertex(mouseX,y+25);
     vertex(mouseX-29,y+40);
     vertex(mouseX-23,y+7);
     vertex(mouseX-47,y-15);
     vertex(mouseX-14,y-20);
     endShape(CLOSE);
    
    fill(0);
    textSize(10);
    text("Year: " + data.get(i).year, mouseX + 50, y);
    text("Brain Activity Levels: " + data.get(i).brainwaves, mouseX + 50, y + 30);
    text("Imagination " + data.get(i).brainwaves, mouseX + 50, y + 50);
  }
}


   