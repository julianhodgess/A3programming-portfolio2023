class SpaceShip {
  int x, y, w, lCount, turretCount, ammo, health;
  PImage ship;


  // Constructor
  SpaceShip () {
    x = 0;
    y = 0;
    w = 90;
    lCount = 1000;
    health = 500;
    turretCount = 1;
    ship = loadImage("ship.png");
  }

  void display() {

    imageMode(CENTER);
    ship.resize(90, 90);
    image(ship, x, y);
  }
  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  boolean fire() {
    if (lCount>0) {
      lCount --;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
