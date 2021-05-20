//Calculator Project
//Josef Johnsen
//11/24/2020

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dval, op, test2;
boolean left, start;
float l, r, result, test, v;

void setup() {
  size(400, 600);
  dval = "0.0";
  op = "";
  left = true;
  l = 0.0;
  r = 0.0;
  start = true;
  result = 0.0;
  numButtons[0] = new Button(120, 400, 60, 60, "0", true, 40);
  numButtons[1] = new Button(40, 320, 60, 60, "1", true, 40);
  numButtons[2] = new Button(120, 320, 60, 60, "2", true, 40);
  numButtons[3] = new Button(200, 320, 60, 60, "3", true, 40);
  numButtons[4] = new Button(40, 240, 60, 60, "4", true, 40);
  numButtons[5] = new Button(120, 240, 60, 60, "5", true, 40);
  numButtons[6] = new Button(200, 240, 60, 60, "6", true, 40);
  numButtons[7] = new Button(40, 160, 60, 60, "7", true, 40);
  numButtons[8] = new Button(120, 160, 60, 60, "8", true, 40);
  numButtons[9] = new Button(200, 160, 60, 60, "9", true, 40);
  opButtons[0] = new Button(300, 160, 60, 40, "+", false, 20);
  opButtons[1] = new Button(300, 220, 60, 40, "-", false, 20);
  opButtons[2] = new Button(300, 280, 60, 40, "×", false, 20);
  opButtons[3] = new Button(300, 340, 60, 40, "/", false, 20);
  opButtons[4] = new Button(300, 400, 60, 40, "x²", false, 20);
  opButtons[5] = new Button(300, 460, 60, 40, "√x", false, 20);
  opButtons[6] = new Button(300, 520, 60, 40, "=var", false, 20);
  opButtons[7] = new Button(40, 400, 60, 60, "±", false, 20);
  opButtons[8] = new Button(200, 400, 60, 60, ".", false, 20);
  opButtons[9] = new Button(40, 480, 60, 60, "CLEAR", false, 15);
  opButtons[10] = new Button(120, 480, 60, 60, "var", false, 20);
  opButtons[11] = new Button(200, 480, 60, 60, "ENTER", false, 15);
}

void draw() {
  background(227);
  fill(#AAA9AD);
  rect(20, 60, 360, 520, 5);
  textSize(40);
  fill(255);
  text("Josef Johnsen", 200, 40);
  textSize(26);
  fill(100);
  text("Calculator", 200, 90);
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  } 
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
  println("L:" + l + " R:" + r + " V:" + v + " O:" + result + start + left);
}

void updateDisplay() {
  fill(100);
  rect(60, 100, 280, 40);
  fill(255);
  if (dval.length()<13) {
    textSize(32);
  } else if (dval.length()<14) {
    textSize(28);
  } else if (dval.length()<15) {
    textSize(26);
  } else if (dval.length()<17) {
    textSize(24);
  } else if (dval.length()<19) {
    textSize(22);
  } else if (dval.length()<21) {
    textSize(20);
  } else if (dval.length()<23) {
    textSize(18);
  } else {
    textSize(16);
  }
  text(dval, 200, 135);
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover && dval.length()<25) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}

void keyPressed() {
  println("Key:" + key + " KeyCode=" + keyCode);
  if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("×", false);
  } else if (key == '/') {
    handleEvent("/", false);
  } else if (keyCode == 10) {
    handleEvent("ENTER", false);
  } else if (keyCode == 8) {
    handleEvent("CLEAR", false);
  } else if (keyCode == 45) {
    handleEvent("±", false);
  } else if (keyCode == 46) {
    handleEvent(".", false);
  }
}

String handleEvent(String val, boolean num) {
  if (left && num) {
    if (start || result == l) {
      dval = val;
      l = float(dval);
      start = false;
    } else {
      dval += val;
      l = float(dval);
    }
  } else if (!left && num) {
    if (start) {
      dval = val;
      r = float(dval);
      start = false;
    } else {
      dval += val;
      r = float(dval);
    }
  } else if (val.equals("CLEAR")) {
    dval = "0.0";
    op = "";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    start = true;
  } else if (val.equals("+")) {
    if (left) {
      op = "+";
      left = false;
      dval = "0";
      start = true;
    } else {
      preformCalc();
      op = "+";
      left = false;
      start = true;
    }
  } else if (val.equals("-")) {
    if (left) {
      op = "-";
      left = false;
      dval = "0";
      start = true;
    } else {
      preformCalc();
      op = "-";
      left = false;
      start = true;
    }
  } else if (val.equals("×")) {
    if (left) {
      op = "×";
      left = false;
      dval = "0";
      start = true;
    } else {
      preformCalc();
      op = "×";
      left = false;
      start = true;
    }
  } else if (val.equals("/")) {
    if (left) {
      op = "/";
      left = false;
      dval = "0";
      start = true;
    } else {
      preformCalc();
      op = "/";
      left = false;
      start = true;
    }
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dval = str(l);
    } else {
      r *= -1;
      dval = str(r);
    }
  } else if (val.equals("x²")) {
      op = "x²";
      preformCalc();
    } else if (val.equals("√x")) {
      op = "√x";
      preformCalc();
    } else if (val.equals("=var")) {
    if (left) {
      start = true;
      v = l;
      dval = "set to variable";
    } else {
      start = true;
      v = r;
      dval = "set to variable";
      left = true;
    }
  } else if (val.equals("var")) {
    if (left) {
      l = v;
      dval = str(v);
    } else {
      r=v;
      dval = str(v);
    }
  } else if (val.equals(".") && !dval.contains(".") ) {
    println("works");
    dval += (".");
  } else if (val.equals("ENTER")) {
    preformCalc();
  }
  return val;
}

void preformCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("×")) {
    result = l * r;
  } else if (op.equals("/")) {
    result = l / r;
  } else if (op.equals("x²") && left) {
    result = l * l;
  } else if (op.equals("x²") && !left) {
    result = r * r;
  } else if (op.equals("√x") && left) {
    result = sqrt(l);
  } else if (op.equals("√x") && !left) {
    result = sqrt(r);
  }
  l = result;
  dval = str(result);
  left = true;
  start = true;
}
