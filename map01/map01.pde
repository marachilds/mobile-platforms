//float x, y;
float centerX, centerY;

//Declare ArrayList of hotspots
ArrayList<Hotspot> hotspot = new ArrayList<Hotspot>();

//Declare image
PImage mapImage;

void setup(){
  //Initialize
  size(500, 500);
  background(0);
  
  //Load image
  mapImage = loadImage("staticMap.png");
  centerX = width/2;
  centerY = height/2;
}

void draw(){
  
  image(mapImage, centerX, centerY, mapImage.width, mapImage.height);
  //image(mapImage, centerX, centerY, width/2, height/2);
  imageMode(CENTER);
  updatePosition();
  
  text(mouseX + ", " + mouseY, 50, 50);
}

void mouseMoved(){
  
}

class Hotspot {
  float _x, _y;
  //x = _x;
  //y = _y;
  void update(float _x, float _y) {
    for(int i = 0; i < 20; i ++){
        noStroke();
        fill(0, 255, 0);
        ellipse(_x, _y, 10, 10);
    }
  }
}

void updatePosition() {
  centerX = map(mouseX, 0, 500, 800, -800);
  centerY = map(mouseY, 0, 500, 800, -800);
  noStroke();
  fill(255, 0, 0);
  ellipse(width/2, height/2, 10, 10);
}