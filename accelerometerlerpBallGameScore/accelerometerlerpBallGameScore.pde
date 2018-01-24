import ketai.sensors.*;
KetaiSensor sensor;

float ax, ay, lax, lay;
float x, y, dx, dy;
float dd = displayDensity;
int score;

void setup() {
  fullScreen(P2D);  
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(LANDSCAPE);
  randomiseGoal();
  PFont font = createFont("SansSerif", 20 * dd);
  textFont(font);
  textAlign(CENTER, CENTER);
  score = 0;
}

void draw() {
  background(0);
  text(score, 50, 50);
  translate(width/2, height/2);
  noFill();
  stroke(255);
  strokeWeight(1);
  ellipse(dx, dy, 150, 150);
  fill(255);
  lax = lerp(lax, ax, 0.1);
  x = map(lax, -10, 10, width/2, -width/2);
  lay = lerp(lay, ay, 0.1);
  y = map(lay, -10, 10, -height/2, height/2);
  ellipse(x, y, 100, 100);
  checkGoal();
}

void checkGoal() {
  //println(dist(x, y, dx, dy));
  if (dist(x, y, dx, dy) < 50) {
    //println("WOOHOO!");
    score++;
    randomiseGoal();
  }
}

void onAccelerometerEvent(float x, float y, float z) {
  //println(x, y, z);
  ax = x;
  ay = y;
}

void randomiseGoal() {
  dx = random(-width/3, width/3);
  dy = random(-height/3, height/3);
}

//void mousePressed() {
//  randomiseGoal();
//}