class Lazer {
  //member variable
  int x, y, speed, rad, damage;
  color c;

  //constructor
  Lazer(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 10;
    rad = 4;
    damage = 50;
    c = 255;
  }

  //member methods

  void fire() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-3) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 3, 6);
  }
}
