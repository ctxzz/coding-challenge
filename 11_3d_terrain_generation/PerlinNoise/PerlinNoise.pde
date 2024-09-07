int totalFrames = 60; 
int frameCount = 0;
String folderName = "frames";

int cols, rows;
int scl = 20;
int w = 2000;
int h = 1500;

float flying = 0;

float[][] terrain;

void setup(){
  size(600, 600, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  new File(folderName).mkdir();
}

void draw(){
  flying += 0.01;
  
  float yoff = flying;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  for(int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
  
  // save frame to folder
  String filename = folderName + "/frame" + nf(frameCount, 3) + ".png"; // フレーム名
  saveFrame(filename);
  
  frameCount++;
  
  if (frameCount >= totalFrames) {
    noLoop(); // stop draw()
  }
}
