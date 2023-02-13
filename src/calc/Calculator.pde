// Julian Hodges | Nov 2022 | Calc Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[14];
String dVal = "0.0";
boolean left = true;
float l, r, result;
char op = ' ';


void setup() {
  size(340, 600);
  numButtons[0] = new Button(20, 520, 140, 60, '0');
  numButtons[1] = new Button(20, 440, 60, 60, '1');
  numButtons[2] = new Button(100, 440, 60, 60, '2');
  numButtons[3] = new Button(180, 440, 60, 60, '3');
  numButtons[4] = new Button(20, 360, 60, 60, '4');
  numButtons[5] = new Button(100, 360, 60, 60, '5');
  numButtons[6] = new Button(180, 360, 60, 60, '6');
  numButtons[7] = new Button(20, 280, 60, 60, '7');
  numButtons[8] = new Button(100, 280, 60, 60, '8');
  numButtons[9] = new Button(180, 280, 60, 60, '9');



  opButtons[11] = new Button(180, 120, 60, 60, '%');
  opButtons[0] = new Button(180, 520, 60, 60, '.');
  opButtons[1] = new Button(260, 440, 60, 60, '+');
  opButtons[2] = new Button(260, 520, 60, 60, '=');
  opButtons[3] = new Button(260, 360, 60, 60, '-');
  opButtons[4] = new Button(260, 280, 60, 60, 'x');
  opButtons[5] = new Button(20, 200, 60, 60, 'C');
  opButtons[6] = new Button(100, 200, 60, 60, '²');
  opButtons[7] = new Button(20, 120, 60, 60, '√');
  opButtons[8] = new Button(100, 120, 60, 60, 'e');
  opButtons[9] = new Button(180, 120, 60, 60, '√');
  opButtons[10] = new Button(260, 200, 60, 60, '÷');
  opButtons[12] = new Button(180, 200, 60, 60, '±');
  opButtons[13] = new Button(260, 120, 60, 60, 'π');
}

void draw () {
  background(60);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 46 || keyCode == 110) {
  handleEvent(".", false);
    }
  }


void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 18) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mouseReleased() {

  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }



  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      op = 'x';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      op = '²';
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      op = '√';
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      op = '%';
      dVal = str(op);
    } else if (opButtons[i].on && opButtons[i].val == 'e') {
      if (left) {
        l = 2.71828;
        dVal = str(l);
      } else {
        r = 2.71828;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + "result:" + result + " left:" + left);
}

void updateDisplay() {
  fill(255);
  rect(20, 20, 300, 80, 10);
  fill(20);
  textSize(20);
  textAlign(RIGHT);
  if (dVal.length() < 6 ) {
    textSize(32);
  } else if (dVal.length() <15) {
    textSize(30);
  } else {
    textSize(20);
  }
  text(dVal, width-100, 80);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
