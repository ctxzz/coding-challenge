int[][] grid;
int w = 5;
int cols, rows;
int hueValue = 200;

int[][] make2DArray(int cols, int rows) {
  int[][] arr = new int[cols][rows]; 
  return arr;
}

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 255, 255);
  cols = width / w;
  rows = height / w;
  grid = make2DArray(cols, rows);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = 0;
    }
  }
}

void mouseDragged() {
  int mouseCol = floor(mouseX / w);
  int mouseRow = floor(mouseY / w);
  
  int matrix = 3;
  int extent = floor(matrix/2);
  for (int i = -extent; i <= extent; i++) {
    for (int j = -extent; j <= extent; j++){
      if(random(1) < 0.75) {
        int col = mouseCol + i;
        int row = mouseRow + j;
        if (col >= 0 && col <= cols - 1 && row >=0 && row <= rows-1){
          grid[col][row] = hueValue;
        }
      }
    }
  }
  hueValue += 1;
  if (hueValue > 360) {
    hueValue = 1;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      noStroke();
      if(grid[i][j] > 0){
        fill(grid[i][j], 255, 255);
        int x = i * w;
        int y = j * w;
        square(x, y, w);
      }
    }
  }
  
  int[][] nextGrid = make2DArray(cols, rows);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int state = grid[i][j];
      if (state > 0){
        if(j < rows -1){
         int below = grid[i][j+1];
         int dir = 1;
         if (random(1) < 0.5) {
           dir *= -1;
         }
         
         //int belowA, belowB;
         int belowA = -1;
         int belowB = -1;
         if(i + dir >= 0 && i + dir <= cols -1) {
           belowA = grid[i+dir][j+1];
         }
         if (i - dir >= 0 && i - dir <= cols -1) {
           belowB = grid[i-dir][j+1];
         }
         
         
          if(below == 0) {
            nextGrid[i][j+1] = state;
          } else if (belowA == 0) {
            nextGrid[i+dir][j+1] = state;
          } else if (belowB == 0) {
            nextGrid[i-dir][j+1] = state;
          } else {
            nextGrid[i][j] = state;
          }
        } else {
          nextGrid[i][j] = state;
        }
      }
    }
  }
  grid = nextGrid;
}
