float dd;
//float hue;
//float rectX, rectY;
//Goal Rectangle Points
float goalAX, goalAY;
float goalBX, goalBY;
float goalCX, goalCY;
float goalDX, goalDY;
//Rectangle Points
float rectWidth, rectHeight;
float rectRotation, rectScale;
float goalX, goalY, goalW, goalH;

void setup(){
  fullScreen(P2D);
  dd = displayDensity;
  rectScale = 1;
  rectWidth = 800;
  rectHeight = 800;
  //hue = 255;
  createGoal();
}

void draw(){
  background(0);
  fill(255);
  rect(goalX, goalY, goalW, goalH);
  checkGoal();
}

void checkGoal(){
  goalAX = goalX;
  goalAY = goalY;
  goalBX = goalX + goalW;
  goalBY = goalY;
  goalCX = goalX + goalW;
  goalCY = goalY + goalH;
  goalDX = goalX;
  goalDY = goalY + goalH;
}

void createGoal (){
  //Prevent goal from rendering off screen
  goalX = random(0, width-goalW);
  goalY = random(0, height-goalH);
  //Goal is at least 5x5 and no more than 1/3 w or h
  goalW = random(5, width/3);
  goalH = random(5, height/3);
}