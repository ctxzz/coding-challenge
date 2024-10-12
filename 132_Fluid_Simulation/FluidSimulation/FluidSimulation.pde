final int N = 128;
final int iter = 16;
final int SCALE = 4;
float t = 0;

Fluid fluid;

// capture
int totalFrames = 600;
int frameCount = 0;
String folderName = "frames";

void settings() {
  size(N*SCALE, N*SCALE);
}


void setup() {
  fluid = new Fluid(0.2, 0, 0.000001);
  new File(folderName).mkdir();
}

//void mouseDragged(){
//}

void draw() {
  background(0);
  int cx = int(0.5*width/SCALE);
  int cy = int(0.5*height/SCALE);
  
  for (int i = -1; i <= 1; i++){
    for (int j = -1; j <= 1; j++){
      fluid.addDensity(cx+i, cy+j, random(100, 500));
    }
  }
  

  float angle = noise(t) * TWO_PI;
  PVector v = PVector.fromAngle(angle);
  v.mult(0.1);
  t += 0.01;

  fluid.addVelocity(cx, cy, v.x, v.y);

  
  fluid.step();
  fluid.renderD();
  fluid.fadeD();
  
  
  // capture
  String filename = folderName + "/frame" + nf(frameCount, 3) + ".png";
  saveFrame(filename);
  frameCount++;

  if (frameCount >= totalFrames) {
    noLoop();
  }
}
