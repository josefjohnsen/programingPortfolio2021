class Star {
  //member variable
  int x, y, speed, dio;
  color c;

  //constructor
  Star(int x, int y) {
    this.x=x;
    this.y=y;
    speed = int(random(1,10));
    dio = int(random(1,3));
    c = color(int(random(190,255)));
  }
  
   boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }

void move(){
  y += speed;
}


  //member methods
  void display(){
  fill(c);
  noStroke();
  ellipse(x,y,dio,dio);
  }
}
