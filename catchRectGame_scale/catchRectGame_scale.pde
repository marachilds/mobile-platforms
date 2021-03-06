float gX, gY;
float rX, rY;
float gScale, rScale;
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
  text("Score: " + score, 120, 50);
  //text(score + "gx, gy: " + gX + ", " + gY, 300, 50);
  //text("rx, ry: " + rX + ", " + rY, 300, 100);
  //text("rScale: " + rScale, 300, 150);
  fill(255, 0, 0);
  noStroke();
  rect(gX, gY, rectWidth * gScale, rectHeight * gScale);
  if (touches.length == 2) {
    rScale = map(touches[0].x + touches[1].x / 2, 0, width, 0.1, 10);
  }
  if(touches.length == 1){
    rX = mouseX;
    rY = mouseY;
  }
  fill(0, 0, 255, 100);
  noStroke();
  rect(rX, rY, rectWidth * rScale, rectHeight * rScale);
  checkGoal();
}

void checkGoal(){
  if((dist(rX, rY, gX, gY) < 10) && (abs(rScale - gScale) < 0.5)) {
    score++;
    createGoal();
  }
  if(touches.length == 3){
  score = 0;
  }
}

void createGoal(){
  //Prevent goal from rendering off screen
  gX = random(100, width-100);
  gY = random(100, height-100);
  gScale = random(1, 8);
}