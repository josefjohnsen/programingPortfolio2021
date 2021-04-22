class Car {

  color c;
  float xpos, ypos, xspeed;
  int rand;
  boolean right;

  //Constructer
  Car(color c, float xspeed) {
    this.c = c;
    xpos = random(width);
    ypos = random(height);
    this.xspeed = xspeed;
    if (int(random(0,2))==1){
      right = true;
    }else{
      right = false;
    }
  }

  //Funtionality
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10, random(1, 8));
    fill(#8991E3);
    ellipse(xpos-7, ypos+6, 6, 6);
    ellipse(xpos+7, ypos+6, 6, 6);
    if (right) {
      rect(xpos+7, ypos-2, 5, 7);
    } else {
      rect(xpos-7, ypos-2, 5, 7);
    }
  }

  void drive() {
    rectMode(CENTER);
    if (right) {
      xpos += xspeed;
      if (xpos > width+random(0, 60)) {
        xpos = 0;
      }
      }else{
      xpos -= xspeed;
      if (xpos < 0-random(0, 60)) {
        xpos = width;
      }
    }
  }
}
