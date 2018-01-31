float gX, gY;
float rX, rY;
float gScale, rScale;
float gRot, rRot;
float rectWidth, rectHeight;
float dd = displayDensity;
int score;

void setup(){
  fullScreen(P2D);
  
  PFont font = createFont("SansSerif", 50 * dd);
  textFont(font);
  textAlign(CENTER, CENTER);
  score = 0;
  
  gScale = 1;
  rScale = 1;
  rectWidth = 50;
  rectHeight = 50;
  createGoal();
}

void draw(){
  background(255);
  rectMode(CENTER);
  fill(50);
  text(score, 50, 50);
  fill(255, 0, 0);
  noStroke();
  rect(gX, gY, rectWidth, rectHeight);
  //scale(gScale);
  rX = mouseX;
  rY = mouseY;
  fill(0, 0, 255);
  noStroke();
  rect(rX, rY, rectWidth, rectHeight);
  checkGoal();
}

void checkGoal(){
  if(dist(rX, rY, gX, gY) < 20){
    score++;
    createGoal();
  }
}

void createGoal(){
  //Prevent goal from rendering off screen
  gX = random(100, width-100);
  gY = random(100, height-100);
  //Goal is at least 5x5 and no more than 1/3 w or h
  //goalW = random(10, width/3);
  //goalH = random(10, height/3);
  //gScale = random(1, 100);
  
  //scale(gScale);
}