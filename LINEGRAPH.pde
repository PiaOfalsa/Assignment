class Linegraph{
  
  String filename ="data.csv";
  String [] rawData;
  int [] years= new int[5];
  int[] injuries = new int[5];
  
  int margin,graphHeight;
  float xSpacer;
  
  PVector [] positions= new  PVector[5];
  //container for pos info
  //keep track of x and y var
  int overallMin;
  int overallMax;
  
  

void drawInterF()
{
  //vert lines
  for(int i=0; i<positions.length;i++){
  stroke(200,100);
  line(positions[i].x,margin,positions[i].x,height - margin);
  text(years[i],positions[i].x -15, height - margin +20);//year labels  
}
  text(overallMax,5,margin);  //max cacluclation displayed 
  text(overallMin,5,height-margin);
}
  
  
void processData(){
   fill(200);
 //load values
 for(int i=0;i<positions.length;i++){
   ellipse(positions[i].x,positions[i].y,15,15);
 }

  
  rawData = loadStrings(filename);
  
  for(int i=1;i<rawData.length;i++){
    String[] thisRow = split(rawData[i],",");
    years[i-1]=int(thisRow[1]);
    injuries[i-1]=int(thisRow[2]);
  }
  int overallMin = min(injuries);
  int overallMax= max (injuries);
  println(overallMax);
  
  margin =50;
  graphHeight = (height-margin) - margin;
  xSpacer = (width - margin - margin)/(years.length -1);
  
  for(int i=0;i<injuries.length;i++){
    
    
    float adjScore = map(injuries[i],overallMin,overallMax,0,graphHeight);
    float yPos = height - margin -adjScore;
    float xPos = margin + (xSpacer *i);
    positions [i]=new PVector(xPos,yPos);
  }
    

}
}//endclass