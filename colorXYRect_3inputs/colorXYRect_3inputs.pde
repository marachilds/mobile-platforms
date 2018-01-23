float dd;
float hue, lineThickness;
float rectWidth, rectHeight;
float rectRotation, rectScale;

void setup(){
  fullScreen(P2D);
  //blendMode(ADD);
  dd = displayDensity;
  rectScale = 1;
}

void draw(){
  background(0);
  //println(touches.length);
  fill(255);
  textSize(24*dd);
  for (int i = 0; i < touches.length; i++) {
    //String s = touches[i].x + "\n" + 
    //           touches[i].y + "\n" + 
    //           touches[i].pressure + "\n" +
    //           touches[i].area;
    //text(s, touches[i].x + 50*dd, touches[i].y - 50*dd);
  }
  for (int i = 0; i < touches.length; i++) {
    switch(i){
      case 0:
        hue = map(touches[i].x, 0, width, 0, 255);
        lineThickness = map(touches[i].y, 0, height, 1, 50);
        rectWidth = 200;
        rectHeight = 800;
        break;
      case 1:
        rectWidth = map(touches[i].x, 0, width, 0, 1000);
        rectHeight = map(touches[i].y, 0, height, 0, 1000);
        break;
      case 2:
        rectRotation = map(touches[i].x, 0, width, 0, TWO_PI);
        rectScale = map(touches[i].y, 0, height, 0.01, 5);
        break;
    }
  }
  translate(width/2, height/2);
  rotate(rectRotation);
  scale(rectScale);
  rectMode(CENTER);
  colorMode(HSB);
  fill(hue, 255, 255);
  rect(0, 0, rectWidth, rectHeight);
  colorMode(RGB);
}