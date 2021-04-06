class PowerUp {
  //member variable
  int x, y, dia, pu, speed, rad;
  char displayMode;
  color c;
  String[] puInfo = {"Ammo", "Health", "Lasers", "SUPER WEAPON"};

  PImage[] images;
  int imageCount;
  int frame;
  //constructor
  //PowerUp(int x, int y) {
  //  this.x = x;
  //  this.y = y;
  //  dia = 50;
  //  rad = 25;
  //  speed = int(random(1,10));
  //  displayMode = '1';
  //  pu = int(random(3));
  //  c = #8B7E7E;
  //}

  boolean reachedBottom() {
    if (y>height+30) {
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }

  PowerUp(int x, int y, String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    this.x = x;
    this.y = y;
    dia = 50;
    rad = 25;
    speed = int(random(1, 10));
    displayMode = '1';
    pu = int(random(3));
    c = #8B7E7E;
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void effect() {
    if (pu == 1) {
      println("Lazers");
      s1.lazers += 1;
    } else if (pu == 2) {
      println("health");
      s1.health += 30;
    } else {
      println("ammo");
      s1.ammo += 50;
    }
  }

  void move() {
    y += speed;
  }
}
