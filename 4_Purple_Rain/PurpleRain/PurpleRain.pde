
Drop[] drops = new Drop[300];

int totalFrames = 300; 
int frameCount = 0;
String folderName = "frames";


void setup(){
  size(640, 360);
  for (int i = 0; i < drops.length; i++){
    drops[i] = new Drop();
  }
  
  new File(folderName).mkdir();
}

void draw(){
  background(230, 230, 250);
  for (int i = 0; i < drops.length; i++){
    drops[i].fall();
    drops[i].show();
  }
  
  String filename = folderName + "/frame" + nf(frameCount, 3) + ".png";
  saveFrame(filename);
  frameCount++;
  if (frameCount >= totalFrames) {
    noLoop();
  }
}
