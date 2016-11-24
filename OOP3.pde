/* Attempt 3

  OOP ASSIGNMENT
  C15734155
*/

//declare class


Scanner scan;
Diagnosis dia;
Grid grids;
Heart heart;
Texts texts;
Baymax bay;



//to store image files
PImage backg;
PImage bod;
PImage brain;
PImage brain2;


PFont big;
//array of angles for pie chart
int[] angles = { 5, 10, 45, 35, 60, 38, 75, 88 };

int [] array ={80,100,80,50,30,9};

void setup(){
  
  size(1920,800);
  frameRate(9);
   bay=new Baymax();
   
   
  bay.drawBay();
  
  
  backg = loadImage("HIRO.jpg");
  bod = loadImage("bod.gif");
  brain = loadImage("brain.png");
  brain2 = loadImage("brain.png");
  
  //create new object
  scan =new Scanner();
  dia = new Diagnosis();
  grids = new Grid();
  heart= new Heart();
  texts=new Texts();
 

  
}



void draw(){ 
  
   if (mousePressed==true)
  {
    display();
    println(frameCount);
    if (frameCount>60)
    {
     background(0);
    }
  }
  
}

//background /images
void updateBack(){
  image(backg,0,0);
  image(bod,50,140);
  image(brain,1360,100);
  image(brain2,1360,580);
}

//piechartt
void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(255,random(255),255);
    arc(1720, 650, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);}
 
  
}

//graph
void graph(){
  
  
  stroke(255);
  for(int i=0; i<array.length;i++){
  
    float rectWidth = 200/(array.length);//x
    float value = random(array[i] );
    float ypos = 150 - value;//y position
    fill(0,255,random(255));
    
    rect((rectWidth *i)+1420,ypos,rectWidth,value);
  
  }

}




void display(){
  
 updateBack();
  
  pushMatrix();
  translate(700,150);
  dia.displayLine();
  scan.drawScan();

 popMatrix();

  pieChart(220, angles);
  grids.displayGrid();
  heart.heart();
  graph();
  texts.displayTexts();
  
}