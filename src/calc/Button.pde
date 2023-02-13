class Button {
  //Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(128);
    c2 = color(200);
    on = false;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }

    rect(x, y, w, h);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    if (val == 'C') {
      text("Clear", x+w/2, (y+h/2)+4);
    } else if (val == 'E') {
      text("x²", x+w/2, (y+h/2)+4);
    } else {
      text(val, x+w/2, (y+h/2)+4);
    }
  }


  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}
