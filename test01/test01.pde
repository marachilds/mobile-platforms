String test = "Hello";

void setup(){
  fullScreen();
  background(10, 25, 0);
}

void draw(){
  //background(255, 0, 0);
  noFill();
  stroke(255, 128);
  ellipse(random(width), random(height), 50, 50);
  fill(255);
  noStroke();
  rect(0, 0, 200, 60);
  fill(0);
  textSize(50);
  text(test, 20, 50);
}