// Julian Hodges | Mon Oct 10th | Screen saver app
float xpos, ypos, strokeW, pointCount;


void setup() {
  size(displayWidth, displayHeight);
  xpos = random(width);
  ypos = random(height);
  background(255);
}


void draw() {
  strokeW = random(1,10);
  pointCount = random(1,30);
  stroke(random(255),random(22), random(99));
  strokeWeight(strokeW);
  if(xpos <0 || xpos > width || ypos <0 || ypos > height) {
    xpos = random(width);
    ypos = random(height);
  }
  if(random(100)>70) {
    moveRight(xpos,ypos,pointCount);
  } else if(random(100)>65) {
    moveUp(xpos, ypos, pointCount);
  } else if(random(100)>65) {
    moveLeft(xpos, ypos, pointCount);
  } else if(random(100)>65) {
    moveDown(xpos, ypos, pointCount);
  }
    
}
  //moveDown(xpos,ypos,pointCount);

void moveRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY + i;
  }
}
