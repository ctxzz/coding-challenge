

void setup(){
  size(600, 600);
}


void draw() {
  background(0);
  stroke(255);
  noFill();
  drawCircle(300, 200, 300);
  noLoop();
}

void drawCircle(float x, float y, float d){
  circle(x, y, d);
  if (d > 2) {
    //float newD = d * random(0.2, 0.85);
    float newD = d;
    drawCircle(x+ newD/2, y, d * 0.5);
    drawCircle(x- newD/2, y, d * 0.5);
    drawCircle(x, y + d*0.5, d * 0.5);
  }
}
