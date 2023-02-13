// Julian Hodges | 28 Nov 2022 | SpaceGame
import processing.sound.*;
SoundFile blaster;
SoundFile explosion;
SoundFile theme;
SpaceShip s1;
ArrayList <Rock> rocks = new ArrayList <Rock>();
ArrayList <PowerUp> powerUps = new ArrayList <PowerUp>();
ArrayList <Laser> lasers = new ArrayList <Laser>();
Timer rockTimer, powerUpTimer;
Star[] stars = new Star[200];
int score, level, rockTime, rockCount, laserCount, rocksPassed;
boolean play;


void setup() {
  size (800, 800);
  blaster = new SoundFile(this, "blaster.wav");
  explosion = new SoundFile(this, "explosion.wav");
  theme = new SoundFile(this, "theme.wav");
  s1 = new SpaceShip();
  rockTime = 1000;
  rockCount = 0;
  laserCount = 0;
  rockTimer = new Timer(rockTime);
  rockTimer.start();
  powerUpTimer = new Timer(5000);
  powerUpTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
  rockCount = 0;
  laserCount = 0;
  rocksPassed = 0;
}
void draw() {
  if (!play) {
    startScreen();
  } else {
    theme.stop();
    background(25);
    infoPanel();
    // Render Stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    } //rendering powerups
    if (powerUpTimer.isFinished()) {
      powerUps.add(new PowerUp());
      powerUpTimer.start();
    }
    // RENDERING ROCKS and detecting ship collision
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health +=100;
        } else if (pu.type == 'A') {
          s1.ammo+=100;
        } else {
          if(s1.turretCount == 3){
          
          s1.turretCount = 3;
          }
          else {
            s1.turretCount++;
          }
          
          
        }


        
        // todo: add sound of explosion
        //todo: add animation of explosion
        //todo: visual effect on the ship
       powerUps.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerUps.remove(pu);
        
      } else {
        pu.display();
        pu.move();
      }
    }
    // distributing rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks:" + rocks.size());
    }
    // RENDERING ROCKS and detecting ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        explosion.stop();
        explosion.play();
        s1.health -= r.diam;
        score-=r.diam;
        // todo: add sound of explosion
        //todo: add animation of explosion
        //todo: visual effect on the ship
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        rocksPassed++;
      } else {
        r.display();
        r.move();
      }
    }
    noCursor();
    // Rendering Lasers
    for (int i = 0; i < lasers.size(); i ++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          //add sound to collision
          //add animation to explosion
          lasers.remove(l);
          r.diam -= 50;
          if (r.diam<10) {
            rocks.remove(r);
          }
          score+=100;
        }
        if (l.reachedTop()) {
          lasers.remove(l);
          println(rocks.size());
        } else {
          l.display();
          l.move();
        }
      }
    }
    //Render Spaceship
    s1.display();
    s1.move(mouseX, mouseY);

    if (s1.health<1 || rocksPassed>15) {
      gameOver();
    }
  }
}



void mousePressed() {
  if (play) {
    blaster.stop();
    blaster.play();
    handleEvent();
  }
}

void keyPressed() {
  handleEvent();
}
void handleEvent() {
  if (s1.fire() && s1.turretCount ==1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount ==2) {
    lasers.add(new Laser(s1.x - 20, s1.y));
    lasers.add(new Laser(s1.x +20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount ==3) {
    lasers.add(new Laser(s1.x - 20, s1.y));
    lasers.add(new Laser(s1.x +20, s1.y));
    println("Lasers:" + lasers.size());
    lasers.add(new Laser(s1.x, s1.y));
  }
}

void infoPanel() {
  fill (128, 128);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill (255);
  textAlign(CENTER);
  textSize(25);
  text("SPACEGAME" + " | Level: " + level + " | Score: " + score + " | Ammo: " + s1.lCount + " | Health: " + s1.health, width/2, 35);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Click or press any key to start...", width/2, height/2);
  theme.play();
  if (mousePressed || keyPressed) {
    play = true;
  }
}


void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  play = false;
  noLoop();
}
