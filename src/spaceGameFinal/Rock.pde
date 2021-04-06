class Rock {
  //member variable
  int x, y, dia, health, speed, rad, count;
  char displayMode;
  color c;


  PImage[] images;
  int imageCount;
  int frame;


  //constructor
  //Rock(int x, int y) {
  //  this.x = x;
  //  this.y = y;
  //  dia = 50;
  //  imageCount = count;
  //  images = new PImage[imageCount];
  //  health = 50;
  //  count = 4;
  //  speed = int(random(5, 10));
  //  rad = 25;
  //  displayMode = '1';
  //  c = #8B7E7E;

  //}


  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }





  Rock(int x, int y, String imagePrefix, int count) {
    this.x = x;
    this.y = y;
    dia = 50;

    imageCount = count;
    images = new PImage[imageCount];
 health = 50;
    count = 4;
    speed = int(random(5, 10));
    rad = 25;
    displayMode = '1';
    c = #8B7E7E;
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  // collition for rocks and lazers
  boolean lazerIntersection(Lazer lazer) {
    float distance = dist(x, y, lazer.x, lazer.y);
    if (distance < rad + lazer.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height+30) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y += speed;
  }

  //member methods
  //void display() {
  //  fill(c);
  //  //ellipse(x, y, dia, dia);
  //  image(rock, x, y);
  //}
}
