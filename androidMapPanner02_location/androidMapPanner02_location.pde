import ketai.sensors.*; 
KetaiLocation location;
double longitude, latitude, altitude, accuracy;
float longX, longY;

PVector offset = new PVector(0, 0, 0);
PImage mapImage;
ArrayList<Hotspot> hotspots = new ArrayList<Hotspot>();
PrintWriter output;

Location temp;
String theX, theY;
float tempX, tempY;
//float spotX, spotY;
//float latX, latY;

void setup() {
  fullScreen(P2D);
  //size(900, 900, P2D);
  background(0);
  mapImage = loadImage("map.png");
  output = createWriter("coordinates.txt");
  for (int i = 0; i < 20; i++) {
    float xCoord = random(-mapImage.width/2, mapImage.width/2);
    float yCoord = random(-mapImage.height/2, mapImage.height/2);
    //hotspots.add(new Hotspot(xCoord, yCoord));
    //Write coordinates
    output.write(xCoord + ", " + yCoord + "\n");
    //println(xCoord + ", " + yCoord);
  }
  output.flush();
  output.close();
  
  String allCoords[] = loadStrings("coordinates.txt");
  String firstXY = allCoords[0];
  String theXY[] = splitTokens(firstXY, ", ");
  tempX = float(theXY[0]);
  tempY = float(theXY[1]);
  //tempX = map(float(theXY[0]), -mapImage.width/2, mapImage.width/2);
  //tempY = map(float(theXY[1]), -mapImage.height/2, mapImage.height/2, -10, 0);
  println(tempX + " " + tempY);
  
  //Test with single hotspot
  hotspots.add(new Hotspot(tempX, tempY));

  //println(allCoords.length);
  //for (int i = 0; i < allCoords.length; i++){
  //}
  //Create temp location where we are
  //temp = new Location("temp");
  //Convert lat and long from doubles to floats
  //longX = (float)latitude;
  //longY = (float)longitude;
  //Map real lat and long to map coords
  //latX = map(longX, 50, 60, mapImage.width/2, -mapImage.width/2);
  //latY = map(longY, -10, 0, mapImage.height/2, -mapImage.height/2);
  //Set temp location to map coords
  //temp.setLatitude(latX);
  //temp.setLongitude(latY);
}

void onResume()
{
  location = new KetaiLocation(this);
  super.onResume();
}

void onLocationEvent(Location _location) {
  //print out the location object
  println("onLocation event: " + _location.toString());
  longitude = _location.getLongitude();
  latitude = _location.getLatitude();
  altitude = _location.getAltitude();
  accuracy = _location.getAccuracy();
  longX = (float)latitude;
  longY = (float)longitude;
  float latX = map(longX, 50, 60, 0, mapImage.width);
  float latY = map(longY, -10, 0, 0, mapImage.height);
  fill(0, 0, 255);
  stroke(255);
  ellipse(latX, latY, 20, 20);
}

void draw() {
  background(0);
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
  
  //Show distance from temp
  //text("Distance to temp: " + location.getLocation().distanceTo(temp), 100, 100);
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
    //Check if on a spot
    if(dx < 10){
      fill(255);
      textSize(30 * displayDensity);
      text("Here is a spot.", myX+25, myY);
    }
  }
  void drawDx() {
    fill(0, 255, 0, a);
    stroke(255, 255 - a);
    ellipse(myX, myY, 50, 50);
  }
}