class EnemyShip {
  //member variables
  int x, y, health;
  char displayMode;
  color c1;

  //constructor
  EnemyShip(color c1) {
    x = 250;
    y = 250;
    health = 100;
    displayMode = '1';
    this.c1 = c1;
  }

  //methods
  void display(int x, int y) {
      this.x = x;
      this.y = y;
      fill(128, 128, 130);
      quad(x-15, y+30, x-40, y+45, x+40, y+45, x+15, y+30);
      ellipse(x, y+10, 30, 90);
      fill(0, 162, 257);
      ellipse(x, y+10, 10, 13);
      ellipse(x, y-10, 13, 13);
      fill(100, 100, 100);
      rect(x-30, y+45, 10, 10);
      rect(x+20, y+45, 10, 10);
      fill(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
      rect(x-30, y+55, 10, random(1, 10));
      rect(x+20, y+55, 10, random(1, 10));

  }
}
