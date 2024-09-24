import controlP5.*;

ControlP5 cp5;

float d = 8;
float n = 5;

void setup(){
  size(800, 800);
  cp5 = new ControlP5(this);
  
  cp5.addSlider("sliderD")
    .setRange(1, 10)
    .setValue(5)
    .setPosition(20, 20)
    .setSize(200, 20);
    
  cp5.addSlider("sliderN")
    .setRange(1, 10)
    .setValue(5)
    .setPosition(20, 60)
    .setSize(200, 20);
}

void draw() {
  background(51);
  d = cp5.getController("sliderD").getValue();
  n = cp5.getController("sliderN").getValue();
  float k = n / d;
  
  pushMatrix();
  translate(width / 2, height / 2);
  
  beginShape();
  stroke(255);
  noFill();
  strokeWeight(1);

  for (float a = 0; a < TWO_PI * 8; a += 0.02){
    float r = 200 * cos(k * a);
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
  }
  endShape(CLOSE);
  
  popMatrix();
  cp5.draw();
}
