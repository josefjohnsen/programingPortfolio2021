//cars game
//Josef Johnsen (Made for fun)

int backcolor, visable,more;
Car c1, c2;
Car[] cars = new Car[20000];

void setup() {
  size(1000, 1000);
  backcolor = 255;
  visable = 10;
  more = 10;
  c1 = new Car(color (1), 10);
  c2 = new Car(color (255), random(1,5));
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car (color (random(255), random(255), random(255)), random(1, 5));
  }
}

void draw() {

  background(backcolor);
  if(mousePressed == true && mouseX<c2.xpos+5 && mouseX>c2.xpos-8 && mouseY<c2.ypos+5 && mouseY>c2.ypos-5){
    backcolor = 5;
    if(visable < 20000){
    visable += more;
    more += more;
    for (int i = 0; i < cars.length; i++) {
    cars[i].xpos = random(width);
    cars[i].ypos = random(height);
  }
  c2.xpos = random(width);
  c2.ypos = random(height);
  if(int(random(0,2)) == 1){
    c2.right = true;
  }else{
    c2.right = false;
  }
    }else {
      visable = 0;
    }
  } else {
    backcolor = 255;
  }
  c1.display();
  c1.drive();
  c2.display();
  c2.drive();
  for (int i = 0; i < visable; i++) {
    cars[i].display();
    cars[i].drive();
  }
  
}
