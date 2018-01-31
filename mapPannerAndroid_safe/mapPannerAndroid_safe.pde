import ketai.sensors.*; 

double longitude, latitude, altitude, accuracy;
KetaiLocation location;

PVector offset = new PVector(0, 0, 0);
PImage mapImage;
ArrayList<Hotspot> hotspots = new ArrayList<Hotspot>();

float floatX, floatY;
float tempLat, tempLong;

void setup() {
  size(900, 900, P2D);
  background(0);
  mapImage = loadImage("map.png");
  for (int i = 0; i < 20; i++) {
    hotspots.add(new Hotspot(random(-mapImage.width/2, mapImage.width/2), random(-mapImage.height/2, mapImage.height/2)));
  }
}

void draw() {
  background(0);
  
  floatX = (float)latitude;
  floatY = (float)longitude;
  tempLat = map(floatX, 55, 56, 0, width);
  tempLong = map(floatY, -5, -4, 0, height);
  
  fill(0, 0, 255);
  ellipse(tempLat, tempLong, 10, 10);
  
  pushMatrix();
  offset.x = map(mouseX, 0, width, mapImage.width/2, -mapImage.width/2);
  offset.y = map(mouseY, 0, height, mapImage.height/2, -mapImage.height/2);
  translate(offset.x, offset.y);
  imageMode(CENTER);
  tint(255, 128);
  image(mapImage, offset.x, offset.y);
  updateHotspots();
  drawDxHotspots();
  popMatrix();
  fill(255, 0, 0);
  ellipse(width/2, height/2, 10, 10);
}

void updateHotspots() {
  for (Hotspot h : hotspots) {
    h.update();
  }
}

void drawDxHotspots() {
  for (Hotspot h : hotspots) {
    h.drawDx();
  }
}

class Hotspot {
  float x, y;
  float myX, myY;
  float dx, a;
  Hotspot(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void update() {
    myX = offset.x - x;
    myY = offset.y - y;
    dx = dist(myX, myY, width/2 - offset.x, height/2 - offset.y);
    a = map(dx, 0, 200, 255, 64);
  }
  void drawDx() {
    fill(0, 255, 0, a);
    stroke(255, 255 - a);
    ellipse(myX, myY, 50, 50);
  }
}

void onResume()
{
  location = new KetaiLocation(this);
  super.onResume();
}

void onLocationEvent(Location _location)
{
  //print out the location object
  println("onLocation event: " + _location.toString());
  longitude = _location.getLongitude();
  latitude = _location.getLatitude();
  altitude = _location.getAltitude();
  accuracy = _location.getAccuracy();
}