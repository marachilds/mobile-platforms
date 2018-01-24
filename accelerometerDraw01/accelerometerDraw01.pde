import ketai.sensors.*;
KetaiSensor sensor;

float ax, ay, lax, lay;
float x, y, dx, dy;
float dd = displayDensity;

void setup() {
  fullScreen(P2D);  
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(LANDSCAPE);
  background(0);
}

void draw() {
  translate(width/2, height/2);
  noFill();
  fill(255);
  stroke(255);
  lax = lerp(lax, ax, 0.1);
  x = map(lax, -10, 10, width/2, -width/2);
  lay = lerp(lay, ay, 0.1);
  y = map(lay, -10, 10, -height/2, height/2);
  ellipse(x, y, 100, 100);
}

void onAccelerometerEvent(float x, float y, float z) {
  //println(x, y, z);
  ax = x;
  ay = y;
}