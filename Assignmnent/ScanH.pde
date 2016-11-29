//vertical scanner
class ScanH {
  int y;
  ScanH() {
    y=0;
  }

  void drawScanH() {
    //final frame
    //Diagnosis Puberty 
    noStroke();
    rect(-200, y, 800, 5);
    y= y+15;

    if (y>height && y==-1)
    {
      y=0;
    }
  }
}