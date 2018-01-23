float dd;
float hue;

void setup(){
  fullScreen(P2D);
  //blendMode(ADD);
  dd = displayDensity;
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
    translate(width/2, height/2);
    rectMode(CENTER);
    colorMode(HSB);
    fill(hue, 255, 255);
    rect(0, 0, touches[i].x, touches[i].y);
    colorMode(RGB);
  }
  for (int i = 0; i < touches.length; i++) {
    switch(i){
      case 0:
        hue = map(touches[i].x, 0, width, 0, 255);
        break;
    }
  }
  //translate(width/2, height/2);
  //rectMode(CENTER);
  //colorMode(HSB);
  //fill(hue, 255, 255);
  //rect(0, 0, touches[i].x, touches[i].y);
  //colorMode(RGB);
}