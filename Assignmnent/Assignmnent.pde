/* FINAL
 
   OOP ASSIGNMENT
   C15734155
   GROUP D
 
  This program is a user interface for a futuristic 
  robot healthcare professional.
  
  the program starts of with Baymax's Greeting
  an audio will be played to indicate that Baymax
  or the Program will start the scan process.
  
  the circulating arc and the horizontal rectangle is the scanner part
  on the right there is a body and a beating heart
  if the heart is clicked a microscopic view of the blood
  cells will be shown
  
  on the left side there are two brains.
  when the top brain is clicked it will display/label its parts
  when the bottom brain is clicked it will display an interactive
  line graph with a slider which data is loaded from a csv file.
  
  You can see on the left hand side a line graph,bar graph and 
  a pie chart that represents the data taken from the scanner.
  
  This is a simple yet futuristic interface that can possibly be
  used in the real world.
  
  A robotic nurse that can scan and detect vital signs.

  
 */


/*/////////////////////////////////////////////////
//declare class, libraries and global variables////
*//////////////////////////////////////////////////


/*/////////////////////////////////////////////////
// sound library used to play the audio files     //
// .* to include all functionality of the library//
*/////////////////////////////////////////////////
import ddf.minim.*;

/*
  sound library used to play the audio files
*/
Minim minim;
AudioPlayer hello;
AudioPlayer beep;


//declare objects
Baymax bay;//introductory frame
Scanner scan;// for the circle/arc scanner
Diagnosis dia;//display the string DIAGNOSIS
Heart heart;//displays beating heart drawn using vertex
Texts texts;//displays texts
ScanH ScanHs;



//to store image files
PImage backg;
PImage bod;
PImage brain;
PImage brain2;



/*///////////////////////
//  GLOBAL VARIABLES  //
*///////////////////////

//array that stores number of blood cell for the blood activity
BloodCell[] bloods = new BloodCell[10];

//array of angles for pie chart
int[] angles = { 15, 10, 45, 25, 60, 38, 75, 98 };

//array for the small bar graph
int [] BarArray ={80, 10, 80, 100, 30, 6, 140, 70, 99};

//small line graph variables
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
  //i used this size because my run screen seems to be small
  size(1920, 800);
  frameRate(10);
  
 
  //create new object
  scan =new Scanner();
  dia = new Diagnosis();
  heart= new Heart();
  texts=new Texts();
  bay=new Baymax();
  ScanHs=new ScanH();
  
  
  //sound var
  minim=new Minim(this);
  hello = minim.loadFile("Hello.mp3");
  beep = minim.loadFile("beep.mp3");
 
        
  hello.play();
 
  //call introductory frame 
  bay.drawBay();
  
  //load images
  backg = loadImage("HIRO.jpg");
  bod = loadImage("bod.gif");
  brain = loadImage("brain.png");
  brain2 = loadImage("brain.png");
  
  //to get the hues and brightness of the pixel
  colorMode(HSB);
  for (int i = 0; i < bloods.length; i++)
  {
    bloods[i] = new BloodCell(random(width), random(height));
  }
 
  //function to load the data for the small line graph with ellipse as point
  processData();
  
  //function to load data for the brain line graph(the one you have to click to see
  loadData();
  minmax();
  //margin for the line graph
  margins = width * 0.1f;
  

}

          ////////////////////////////////////////////////////////////
          //////////////////start of the D R A W  method//////////////
          ////////////////////////////////////////////////////////////

void draw() { 

  //draw should only be called when setup has been on for 45 frames

  if (frameCount>45)
  {
    beep.play();//play scanning music
    updateBack();//calls images back

    pushMatrix();
    translate(700, 150);
    dia.control(); //displays diagnosis
    scan.drawScan();//displays circulating scanner
    popMatrix();
    pieChart(220, angles);//displays a pie chart
    heart.heart();//displays the heart

    graph();//displays a bar graph
    
    texts.displayTexts();//shows the text baseline and patient
    texts.displaySymptoms();//displays the symptoms
 
    
    drawInterF();//display line graph
  
    
    fill(0, random(255), random(255));
    //loop that draw the circle/ellipse point of the line graph
    for (int i=0; i<positions.length; i++)
    {
      ellipse(positions[i].x, positions[i].y, 10, 10);  
    }
    
    /*
      if mouse is pressed on the heart area,
      the blood activity will be displayed
      
    */
    if (mousePressed)
    {
        if (mouseX >110 && mouseX<240 && mouseY>270 && mouseY<310)
        { 
           
          background(255,0,0);
           
          loadPixels();
          //TWO LOOPS
          //ONE TO LOOK AT EVERY SINGLE X
          //NEXT  LOOK AT EVERY SINGLE Y
          
          //SINCE ALL PIXELS ARE STORED IN 1D ARRAY
          
          
          for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
              int index = x + y * width;//WE CAN GET THE INDEX INTO THAT ARRAY 
              float sum = 0;//stores the color
              
              for (BloodCell b : bloods) {
                float d = dist(x, y, b.pos.x, b.pos.y);//Distance between x and y and the cell position
                sum += 10 * b.r / d;//color to be the blood radius / distance
              }
              pixels[index] = color(255,sum%140,sum%255);//MIX UP COLOR OF PIXEL
            }
          }

          updatePixels();
        
          for (BloodCell b : bloods) {
            b.update();
            //b.show();
          }        
             }
   } 
   
   /*
     if the bottom brain is clicked a line graph will be displayed
     which shows data loaded from brain.csv file which is interactive when you
     hover the mouse to a value there is a vertical line that slides and shows
     the year and brain activity level etc.
   */
   
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
     
     if (mousePressed)
     {
           //parts of the brain
            if (mouseX >1200 && mouseX<1500 && mouseY>200 && mouseY<400)
            { 
              
              pushMatrix();
              translate(-210, -310);
            
             
              textSize(20);
              text("PARIETAL LOBE",1480,200);
              text("FRONTAL LOBE",1300,230);
              text("TEMPORAL LOBE",1380,280);
              text("OCCIPITAL LOBE",1550,260);
              text("CEREBELLUM",1520,330);
              text("BRAIN STEM",1500,360);
              
              popMatrix();
            }
     }

    println(frameCount);
  }//end if control
  

}


//method to keep updating the background and the images in the loop
void updateBack() {
  image(backg, 0, 0);
  image(bod, 50, 140);
  image(brain, 1340, 170);
  image(brain2, 1340, 560);
  noFill();
  
  stroke(172,247,249);
  rect(15,15,1890,770);
}

//method to draw the pie chart with random blue colors
void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(0, random(255), 255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}

/*
    method to draw the small bar graph with
    random y values so it looks like its 
    fluctuating and vice versa
*/
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

//method to draw line graph interface
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

//method to read data for line graph
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



//method of brain line graph which loads the external data
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

//method to calculate the minimum and maximum value of the data
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

//method that draws the line graph with a slider guide
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

//draw the slide bit of the line graph its a vertical line with a circle marking
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
    
    fill(255, 0, 0);
    noStroke();
    ellipse(mouseX, y, 10,10);
    
    
    fill(0);
    textSize(18);
    text("Year: " + data.get(i).year, mouseX + 50, y);
    text("Brain Activity Levels: " + data.get(i).brainwaves, mouseX + 50, y + 30);
    text("Imagination " + data.get(i).brainwaves, mouseX + 50, y + 50);
  }
}


  