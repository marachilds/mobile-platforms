import ketai.ui.*;

KetaiList selectionlist;
ArrayList<String> colorlist = new ArrayList<String>();
color backgroundcolor = color(0, 0, 0);

float triY;
float triX;

void setup(){
  fullScreen();
  orientation(LANDSCAPE);
  textSize(28);
  textAlign(CENTER);
  colorlist.add("Black");
  colorlist.add("Red");
  colorlist.add("Green");
  colorlist.add("Blue");
  colorlist.add("Gray");
}

void draw(){
  //background(backgroundcolor);
  drawUI();
  for (int i = 0; i < touches.length; i++){
    triX = touches[i].x;
    triY = touches[i].y;
    noFill();
    stroke(255, 255, 255);
    triangle(triX - 50, triY + 50, triX, triY - 50, triX + 50, triY + 50);
  }
  //if(touches.length == 2){
  //  background(backgroundcolor);
  //}
}

void mousePressed()
{
  if (mouseY < 100)
  {
    if (mouseX < width)
      selectionlist = new KetaiList(this, colorlist);
  }
}

void onKetaiListSelection(KetaiList klist)
{
  String selection = klist.getSelection();
  if (selection == "Black")
    background(0, 0, 0);
  else if (selection == "Red")
    background(255, 0, 0);
  else if (selection == "Green")
    background(0, 255, 0);
  else if (selection == "Blue")
    background(0, 0, 255);
  else if (selection == "Gray")
    background(128, 128, 128);
}


void drawUI()
{
  pushStyle();
  textAlign(LEFT);
  fill(0);
  stroke(0);
  rect(0, 0, width, 100);
  //rect(width/3, 0, width/3, 100);
  //rect((width/3)*2, 0, width/3, 100);

  fill(255);
  text("Background Color", 20, 60); 
  popStyle();
}