class SpaceShip {
  //member variables
  int x, y, health, ammo, lives, rad,lazers;
  char displayMode;
  color c1;
  boolean superWeapon;

  //constructor
  SpaceShip(color cl) {
    x = 0;
    lazers = 1;
    y = 0;
    health = 100;
    ammo = 100;
   
    lives = 3;
    rad = 25;
    displayMode = '1';
    this.c1 = c1;
  }

  // collition for rocks and spaceship
  boolean rockIntersection(Rock rock) {
    float distance = dist(x,y,rock.x,rock.y);
    if (distance < rad + rock.rad){
      return true;
    } else{
      return false;
    }
  }

boolean powerUpIntersection(PowerUp powerUp) {
    float distance = dist(x,y,powerUp.x,powerUp.y);
    if (distance < rad + powerUp.rad){
      return true;
    } else{
      return false;
    }
  }

  //methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    if (displayMode == '1') {
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
}
