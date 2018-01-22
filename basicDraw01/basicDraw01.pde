float triY;
float triX;

void setup(){
  background(155, 221, 255);
}

void draw(){
  for (int i = 0; i < touches.length; i++){
    triX = touches[i].x;
    triY = touches[i].y;
    noFill();
    stroke(255, 255, 255);
    triangle(triX - 50, triY + 50, triX, triY - 50, triX + 50, triY + 50);
  }
  if(touches.length == 2){
    background(155, 221, 255);
  }
}